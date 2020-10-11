class AppointmentController < ApplicationController #inherits all configurations that are avail in the very high level controller

    #create
    get '/appointments/new' do
        erb :'appointments/new'
    end

    post '/appointments' do
        @appointment = Appointment.create(params)
        redirect "/appointments/#{@appointment.id}"
    end

    get '/appointments/:id' do #read individual instance of an appointment that matches id number
        @appointment = Appointment.find(params[:id]) 
        erb :'/appointments/show'
    end
  
    get '/appointments' do #read all instances in Appointment class
        @appointments = Appointment.all
        erb :'/appointments/index'
    end
    
    get '/appointments/:id/edit' do
        @appointment = Appointment.find(params[:id])
        erb :'/appointments/edit'
    end
    
    patch '/appointments/:id' do
        
        @appointment = Appointment.find(params[:id])
        @appointment.name = params[:name]
        @appointment.email = params[:email]
        @appointment.date = params[:date]
        @appointment.event = params[:event]
        @appointment.rate = params[:rate]
        @appointment.save
        redirect "/appointments/#{@appointment.id}"
    end

    delete '/appointments/:id' do
        binding.pry
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect to '/appointments'
    end
   




end