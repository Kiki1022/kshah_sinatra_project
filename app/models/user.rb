class User < ActiveRecord::Base #inherit from ActiveRecord need to do this and create migration
    has_secure_password #bcrypt macro that looks out or takes in an argument of password_digest attribute to salt the password. has a method called authenticate. takes plain pw and checks it against bcrypt pw digest.
    has_many :clients #macro that allows us to call user.clients provided by ActiveRecord
    validates_uniqueness_of :username

 
end