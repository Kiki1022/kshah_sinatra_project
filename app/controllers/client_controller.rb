class ClientController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/appointments/new' do
        erb :'appointments/new'
    end

    post '/appointments' do
        @client = Client.create(params)
        redirect "/appointments/#{@appointment.id}"
    end

    get '/appointments/:id' do #read individual instance of an appointment that matches id number
        @client = Client.find(params[:id]) 
        erb :'/appointments/show'
    end
  
    get '/appointments' do #read all instances in Appointment class
        @clients = Client.all
        erb :'/appointments/index'
    end
    
    get '/appointments/:id/edit' do
        @appointment = Appointment.find(params[:id])
        erb :'/appointments/edit'
    end
    
    patch '/appointments/:id' do
        
        @client = Client.find(params[:id])
        @client.name = params[:name]
        @client.email = params[:email] 
        @client.event = params[:event]
        @client.rate = params[:rate]
        @client.save
        redirect "/appointments/#{@appointment.id}"
    end

    delete '/appointments/:id' do
        @client = Client.find(params[:id])
        @client.destroy
        redirect to '/appointments'
    end
   




end