class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
        t.string :username 
        t.string :password_digest #password_digest becuase 
    end
  end
end

#t.datatype and attribute name