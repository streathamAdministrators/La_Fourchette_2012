class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.boolean :is_active, :null => false
      t.boolean :is_available, :null => false
      t.integer :nb_seat, :null => false
      t.integer :numero_table, :null => false

      t.references :employee, :null => false
      t.references :restaurant, :null => false

      t.timestamps
    end
    add_index :tables, :employee_id, :null => false
    add_index :tables, :restaurant_id, :null => false
  end
end