class AppointmentController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/appointments/new' do
        erb :'appointments/new'
    end

    post '/appointments' do
        @appointment = Appointment.create(params)
        redirect "/appointments/#{@appointment.id}"
    end

    get '/appointments/:id' do #read individual instance of an appointment 
        @appointment = Appointment.find(params[:id]) 
        erb :'/appointments/show'
    end
  
    get '/appointments' do #read all instances in Appointment class
        @appointments = Appointment.all
        erb :'/appointments/index'
    end
    
    

    #update

    #delete


end