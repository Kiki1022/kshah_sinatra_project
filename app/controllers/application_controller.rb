require './config/environment'

class ApplicationController < Sinatra::Base
  #register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #enable the session hash
    set :session_secret, 'secret' #set session secret for an extra layer of security
  end

  get "/" do
    erb :welcome
  end

  helpers do
    # def redirect_if_not_logged_in
    #   if !logged_in?
    #     redirect "/login?error=You have to be logged in to do that"
    #   end
    # end

    def logged_in?
      !!session[:user_id]
    end

  
    def current_user #keeps track of logged in user
     #@current_user =  User.find(id: session[:user_id]) #want this to return truthy or falsey
     @current_user ||= User.find(session[:user_id])

    end
  end
end
