class ClientController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/clients/new' do
        erb :'clients/new'
    end

    post '/clients' do
        @client = Client.create(params)
        redirect "/clients/#{@client.id}"
    end

    get '/clients/:id' do #read individual instance of an appointment that matches id number
        @client = Client.find(params[:id]) 
        erb :'/clients/show'
    end
  
    get '/clients' do #read all instances in Appointment class
        @clients = Client.all
        erb :'/clients/index'
    end
    
    get '/clients/:id/edit' do
        @client = Client.find(params[:id])
        erb :'/clients/edit'
    end
    
    patch '/clients/:id' do
        
        @client = Client.find(params[:id])
        @client.name = params[:name]
        @client.email = params[:email] 
        @client.event = params[:event]
        @client.rate = params[:rate]
        @client.save
        redirect "/clients/#{@client.id}"
    end

    delete '/clients/:id' do
        @client = Client.find(params[:id])
        @client.destroy
        redirect to '/clients'
    end
end