class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.boolean :is_active
      t.string :name
      t.decimal :price
      t.datetime :time
      
      t.references :product_type

      t.timestamps
    end
    
    add_index :items, :product_type_id
  end
end
