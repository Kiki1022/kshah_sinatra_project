class UsersController < ApplicationController
    
    get '/users/signup' do 
        erb :'/users/signup' 
    end
    
    post '/users/signup' do 
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
        erb :'/users/login'
    end

    post '/users/login' do 
     
        @user = User.find_by(username: params[:username])  
        
            if @user && @user.authenticate(params[:password]) 
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
                flash.now[:message] = "Oops! You can't do that! Sign Up or Log in to access your profile"
                erb :'welcome' 
            end
    end

    get '/logout' do 
        session.clear
        flash[:message]= "You have successfully been logged out."
        redirect '/'
    end
end