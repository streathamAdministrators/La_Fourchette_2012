class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :city, :null => false
      t.boolean :is_active, :null => false

      t.timestamps
    end
  end
end
