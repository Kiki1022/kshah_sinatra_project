require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #enable the session hash
    set :session_secret, 'secret' #set session secret for an extra layer of security
  end

  get "/" do
    erb :welcome
  end

end
