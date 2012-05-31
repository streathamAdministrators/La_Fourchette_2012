class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :password, :null => false
      t.string :username, :null => false

      t.timestamps
    end
  end
end
