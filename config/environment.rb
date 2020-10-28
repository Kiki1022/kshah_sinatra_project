ENV['SINATRA_ENV'] ||= "development" #sets up connection to database

require 'bundler/setup' #bundling and requiring all of our gems
Bundler.require(:default, ENV['SINATRA_ENV']) 

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
