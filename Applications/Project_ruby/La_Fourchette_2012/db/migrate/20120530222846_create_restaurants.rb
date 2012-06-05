class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :city, :null => false
      t.string :name, :null => false

      t.timestamps
    end
  end
end