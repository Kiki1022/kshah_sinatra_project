class Client < ActiveRecord::Base
    belongs_to :user
    validates :name, :email, :event, :rate, presence:true
    validates :rate, numericality: {greater_than: 0}
end