class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "username",:limit=>25
      t.string "first_name",:limit=>25
      t.string "last_name",:limit=>50 	
      t.string "email",:null=>false 
      t.string "password"  
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
