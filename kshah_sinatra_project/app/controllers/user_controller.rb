class UserController < ApplicationController
    
    get '/users/signup' do 
        erb :'/users/signup'
    end
    
    post '/users/signup' do
        @user = User.create(params)
        redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
        @user = User.find(params[:id]) 
        erb :'/users/show'
    end

end