class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      
      t.references :order
      t.references :element_state
      t.references :item

      t.timestamps
    end
    add_index :elements, :order_id
    add_index :elements, :element_state_id
    add_index :elements, :item_id
  end
end
