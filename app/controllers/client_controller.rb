class ClientController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/clients/new' do
        erb :'clients/new'
    end

    post '/clients' do
        @client = Client.new(params)
        if !@client.save 
            @errors = @client.errors.full_messages
            erb :"clients/new"
        else
            @client = Client.create(params) #do i need to change create to new?
            @client.user = current_user
            @client.save
        redirect "/clients/#{@client.id}"
        end
    end

    get '/clients/:id' do #read individual instance of an appointment that matches id number
        
        @client = Client.find(params[:id]) 
            if logged_in? && @client.user == current_user
                erb :'/clients/show'
            else
                redirect 'users/login'
            end
    end
  
    get '/clients' do #read all instances in Appointment class 
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
        redirect to '/clients'
    end
end