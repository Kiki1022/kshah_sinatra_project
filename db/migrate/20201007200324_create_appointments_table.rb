class CreateAppointmentsTable < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :email 
      t.datetime :date
      t.datetime :time
      t.string :event
      t.float :rate
      t.string :image_url
    end
  end
end
