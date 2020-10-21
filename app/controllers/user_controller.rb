class UserController < ApplicationController
    
    get '/users/signup' do 
        erb :'/users/signup' # do i have my user object here? no. we don't need session here b/c we don't knonw about user yet
    end
    
    post '/users/signup' do #now we created user object, they have id we can utilize ##need to add code for if username is taken
        @user = User.create(params)
        if !@user.save 
            flash[:error] = "#{@user.errors.full_messages.to_sentence}"
            redirect to "/users/signup"
        else
            session[:user_id] = @user.id
            flash.now[:message] = "Create your first client profile now!"
            erb :"/users/show" 
        end
    end

    get '/users/login' do
        #if user is logged in 
        #redirect to their home page
        #else, show them the login form
        erb :'/users/login'
    end

    post '/users/login' do
     
        @user = User.find_by(username: params[:username])   #find will result to finding id number vs find_by will find a certain field eg username or pw

            if @user && @user.authenticate(params[:password]) #find the user by email. hash[:key] params[:password]. authenticate instance of user
                session[:user_id] = @user.id #creating a key/value pair in the sessions hash for the user actually logs them in  
                redirect "/users/#{@user.id}" #interpolate current user id
            else
                flash[:message] = "Please check your credentials and try again"
                redirect "/users/login"
            end
    end

    get '/users/:id' do #logged in user's homepage
        @user = User.find(params[:id]) 
            if logged_in? && @user == current_user #still letting current user see other user homepage
                erb :'/users/show'
            else
                flash[:message] = "Oops! You can't do that! Log in to access your profile"
                erb :'/users/login' #redirect? or erb?
            end
    end

    get '/logout' do 
        session.clear
        flash[:message]= "You have successfully logged out."
        redirect '/'
    end


end