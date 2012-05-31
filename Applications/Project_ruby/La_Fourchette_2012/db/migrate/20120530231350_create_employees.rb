class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :password
      t.string :username

      t.timestamps
    end
  end
end
