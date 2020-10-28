require './config/environment'

class ApplicationController < Sinatra::Base #inheriting from Sinatra
  

  configure do
    set :public_folder, 'public' #setting public folder public
    set :views, 'app/views' #configuring our views
    enable :sessions #hash readily availble to our controllers and enables session
    set :session_secret, 'secret' #set a session secret for an extra layer of security
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do #add functionality to application, can access in any controller
 
    def logged_in?
      !!session[:user_id] #boolean to return truthy or falsey if user is logged in or not
    end

    def current_user
     @current_user ||= User.find(session[:user_id])
    end
  end
end
