class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :password, :null => false
      t.string :username, :null => false
      
      t.references :restaurant, :null => false

      t.timestamps
    end
    add_index :employees, :restaurant_id
  end
end