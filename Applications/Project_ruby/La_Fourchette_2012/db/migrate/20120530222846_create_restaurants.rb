class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :city
      t.boolean :is_active

      t.timestamps
    end
  end
end
