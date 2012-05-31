class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.boolean :is_active
      t.boolean :is_available
      t.integer :nb_seat
      t.integer :numero_table

      t.references :employee
      t.references :restaurant

      t.timestamps
    end
    add_index :tables, :employee_id
    add_index :tables, :restaurant_id
  end
end
