require './config/environment' 

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' #if migrations are pending, this error will be raised
end

use Rack::MethodOverride #allows me to send patch and delete requests through rack b/c sinatra does not allow those methods, Sinatra sits on top of Rack
run ApplicationController
use UsersController #inheriting from ApplicationController
use ClientsController

#mounting controller with keyword 'use'
#this is the executable file, allows us to leverage rack