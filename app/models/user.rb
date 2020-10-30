class User < ActiveRecord::Base
    has_secure_password 
    has_many :clients 
    validates_uniqueness_of :username
end