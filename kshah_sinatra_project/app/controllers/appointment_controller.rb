class AppointmentController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/appointments/new' do
        erb :'appointments/new'
    end

    post '/appointments' do
        @appointment = Appointment.create(params)
        redirect "/appointments/#{@appointment.id}"
    end

    get '/appointments/:id' do
        @appointment = Appointment.find(params[:id]) 
        erb :'/appointments/show'
    end
  
    get '/appointments' do
        @appointments = Appointment.all
        erb :'appointments/index'
    end
    
    #read

    #update

    #delete


end