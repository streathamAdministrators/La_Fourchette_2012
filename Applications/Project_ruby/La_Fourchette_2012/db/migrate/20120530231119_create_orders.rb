class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :price
      
      t.references :table, :null => false
      t.references :order_state, :null => false

      t.timestamps
    end
    add_index :orders, :table_id, :null => false
    add_index :orders, :order_state_id, :null => false
  end
end
