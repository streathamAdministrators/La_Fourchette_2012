class CreateElementStates < ActiveRecord::Migration
  def change
    create_table :element_states do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end
end
