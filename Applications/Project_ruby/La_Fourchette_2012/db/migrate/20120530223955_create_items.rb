class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.boolean :is_active, :null => false
      t.string :name, :null => false
      t.decimal :price, :null => false
      t.datetime :time
      
      t.references :product_type, :null => false

      t.timestamps
    end
    
    add_index :items, :product_type_id, :null => false
  end
end
