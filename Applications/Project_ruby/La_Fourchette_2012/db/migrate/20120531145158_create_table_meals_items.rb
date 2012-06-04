class CreateTableMealsItems < ActiveRecord::Migration
  def up
    create_table 'items_meals' do |t|
      t.integer :item_id, :null => false
      t.integer :meal_id, :null => false
  end

  def down
    drop_table 'mealss_items'
    drop_table 'meals_items'
  end
  end
end