class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email 
      t.string :event
      t.float :rate
    end
  end
end
