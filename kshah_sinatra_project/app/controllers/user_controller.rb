class UserController < ApplicationController
    
    get '/users/signup' do 
        erb :'/users/signup' # do i have my user object here? no. we don't need session here b/c we don't knonw about user yet
    end
    
    post '/users/signup' do #now we created user object, they have id we can utilize
        if params[:username] == "" && params[:password] == ""
            redirect "/users/signup"
        else
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}" 
        end
    end

    get '/users/login' do
        #if user is logged in 
        #redirect to their home page
        #else, show them the login form
        erb :'/users/login'
    end

    post '/users/login' do
      @user =  User.find_by(username: params[:username])   #find will result to finding id number vs find_by will find a certain field

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect "/users/login"
        end
    end

    get '/users/:id' do
        @user = User.find(params[:id]) 
        erb :'/users/show'
    end

    get 'users/all' do 
        @user = User.all
        erb :'/users/index'
    end
end