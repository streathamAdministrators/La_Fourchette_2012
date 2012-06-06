class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :password_hash, :null => false
      t.string :password_salt, :null => false
      t.string :username, :null => false
      
      t.boolean :is_active, :null => false
      
      t.references :restaurant

      t.timestamps
    end
    add_index :employees, :restaurant_id
  end
end