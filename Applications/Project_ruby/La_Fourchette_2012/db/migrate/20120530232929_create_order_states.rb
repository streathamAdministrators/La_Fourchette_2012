class CreateOrderStates < ActiveRecord::Migration
  def change
    create_table :order_states do |t|
      t.string :name, :null => false
      t.integer :priority, :null => false

      t.timestamps
    end
  end
end