class CreateTableMealsItems < ActiveRecord::Migration
  def up
    create_table 'meals_items' do |t|
      t.integer :meal_id, :null => false
      t.integer :item_id, :null => false
  end

  def down
    drop_table 'mealss_items'
  end
  end
end