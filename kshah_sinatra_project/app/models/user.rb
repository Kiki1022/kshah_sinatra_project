class User < ActiveRecord::Base
    has_many :appointments
    
end