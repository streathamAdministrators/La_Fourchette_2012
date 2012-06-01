class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      
      t.references :order, :null => false
      t.references :element_state, :null => false
      t.references :item, :null => false

      t.timestamps
    end
    add_index :elements, :order_id, :null => false
    add_index :elements, :element_state_id, :null => false
    add_index :elements, :item_id, :null => false
  end
end