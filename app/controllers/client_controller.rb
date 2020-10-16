class ClientController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/clients/new' do
        erb :'clients/new'
    end

    post '/clients' do
        @client = Client.create(params)
        @client.user = current_user
        @client.save
        redirect "/clients/#{@client.id}"

    end

    get '/clients/:id' do #read individual instance of an appointment that matches id number
        @client = Client.find(params[:id]) 
        erb :'/clients/show'
    end
  
    get '/clients' do #read all instances in Appointment class
        @clients = current_user.clients 
        erb :'/clients/index'
    end
    
    get '/clients/:id/edit' do
        @client = Client.find(params[:id])
            if logged_in?
            erb :'/clients/edit'
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
            redirect '/users/login'
        end
    end

    delete '/clients/:id' do
        @client = Client.find(params[:id])
        @client.destroy
        redirect to '/clients'
    end
end