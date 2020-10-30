class ClientsController < ApplicationController
 
 
    get '/clients/new' do
        erb :'clients/new'
    end

    post '/clients' do
        @client = Client.new(params)
            if !@client.save 
                @errors = @client.errors.full_messages
                erb :"clients/new"
            else
                @client = Client.create(params)
                @client.user = current_user
                @client.save
                redirect "/clients/#{@client.id}"
            end
    end

    get '/clients/:id' do 
        @client = Client.find(params[:id]) 
            
            if logged_in? && @client.user == current_user
                erb :'/clients/show'
            else
                flash[:message] = "Stay in your lane boo! Sign in to access your profile"
                redirect '/'
            end
    end
  
    get '/clients' do 
        if logged_in? 
            @clients = current_user.clients 
            erb :'/clients/index'
        else
            redirect :'/users/login'
        end
    end
    
    get '/clients/:id/edit' do
        @client = Client.find(params[:id])
            
            if logged_in? && @client.user == current_user
                    erb :'/clients/edit'
                else
                    redirect 'users/login'
            end
    end
    
    patch '/clients/:id' do
        @client = Client.find(params[:id])

            if logged_in? && @client.user == current_user
                @client.name = params[:name]
                @client.email = params[:email] 
                @client.event = params[:event]
                @client.rate = params[:rate]
                @client.save
                    redirect "/clients/#{@client.id}"
                else
                    redirect "/users/login"
            end
    end

    delete '/clients/:id' do
        @client = Client.find(params[:id])
        @client.destroy
        flash[:message] = "Client Deleted."
        redirect to '/clients'
    end
end