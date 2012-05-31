class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.boolean :is_active
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
