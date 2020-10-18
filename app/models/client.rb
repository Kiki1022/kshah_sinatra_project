class Client < ActiveRecord::Base
    belongs_to :user
    validates :name, :email, :event, :rate, presence:true
end