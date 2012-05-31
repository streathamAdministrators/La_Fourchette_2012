class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :price
      
      t.references :table
      t.references :order_state

      t.timestamps
    end
    add_index :orders, :table_id
    add_index :orders, :order_state_id
  end
end
