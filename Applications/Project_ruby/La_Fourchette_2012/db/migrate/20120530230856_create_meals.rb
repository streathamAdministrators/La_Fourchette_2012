class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.boolean :is_active, :null => false
      t.string :name, :null => false
      t.integer :price

      t.timestamps
    end
  end
end
