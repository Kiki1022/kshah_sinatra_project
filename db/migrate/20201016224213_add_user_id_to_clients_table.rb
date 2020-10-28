class AddUserIdToClientsTable < ActiveRecord::Migration
  def change
    add_column :clients, :user_id, :integer
  end
end
#:user_id foreign key points to primary key in another table(users table) 
#added column to clients table, datatype user_id, type integer