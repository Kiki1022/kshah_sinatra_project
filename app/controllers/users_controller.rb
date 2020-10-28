class UsersController < ApplicationController
    
    get '/users/signup' do #rendering signup form
        erb :'/users/signup' 
    end
    
    post '/users/signup' do #receiving data(params) from signup form
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

    get '/users/login' do #rendering login form
        erb :'/users/login'
    end

    post '/users/login' do #receving data(params) from login form
     
        @user = User.find_by(username: params[:username])  #find my username b/c that is the data we are getting back in our params

            if @user && @user.authenticate(params[:password]) #has_secure_password gives us authenticate method, we want to call authenticate off of user in their params hash(params[:password]) this is actually what is going to authenticate user
                session[:user_id] = @user.id 
                redirect "/users/#{@user.id}" 
            else
                flash[:message] = "Invalid username or password"
                redirect "/users/login"
            end
    end

    get '/users/:id' do 

        @user = User.find(params[:id]) 
            if logged_in? && @user == current_user 
                erb :'/users/show'
            else
                flash.now[:message] = "Oops! You can't do that! Log in to access your profile"
                erb :'/users/login' 
            end
    end

    get '/logout' do 
        session.clear
        flash[:message]= "You have successfully been logged out."
        redirect '/'
    end
end