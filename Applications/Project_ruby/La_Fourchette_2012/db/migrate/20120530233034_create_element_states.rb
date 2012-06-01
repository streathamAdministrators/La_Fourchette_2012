class CreateElementStates < ActiveRecord::Migration
  def change
    create_table :element_states do |t|
      t.string :name, :null => false
      t.integer :priority, :null => false

      t.timestamps
    end
  end
end