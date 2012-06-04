# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120531145158) do

  create_table "element_states", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "priority",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "elements", :force => true do |t|
    t.integer  "order_id",         :null => false
    t.integer  "element_state_id", :null => false
    t.integer  "item_id",          :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "elements", ["element_state_id"], :name => "index_elements_on_element_state_id"
  add_index "elements", ["item_id"], :name => "index_elements_on_item_id"
  add_index "elements", ["order_id"], :name => "index_elements_on_order_id"

  create_table "employees", :force => true do |t|
    t.string   "password_hash", :null => false
    t.string   "password_salt", :null => false
    t.string   "username",      :null => false
    t.integer  "restaurant_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "employees", ["restaurant_id"], :name => "index_employees_on_restaurant_id"

  create_table "items", :force => true do |t|
    t.boolean  "is_active",       :null => false
    t.string   "name",            :null => false
    t.string   "description",     :null => false
    t.decimal  "price",           :null => false
    t.datetime "time"
    t.integer  "product_type_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "items", ["product_type_id"], :name => "index_items_on_product_type_id"

  create_table "items_meals", :force => true do |t|
    t.integer "item_id", :null => false
    t.integer "meal_id", :null => false
  end

  create_table "meals", :force => true do |t|
    t.boolean  "is_active",  :null => false
    t.string   "name",       :null => false
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_states", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "priority",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "price"
    t.integer  "table_id",       :null => false
    t.integer  "order_state_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "orders", ["order_state_id"], :name => "index_orders_on_order_state_id"
  add_index "orders", ["table_id"], :name => "index_orders_on_table_id"

  create_table "product_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "city",       :null => false
    t.string   "name",       :null => false
    t.boolean  "is_active",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tables", :force => true do |t|
    t.boolean  "is_active",     :null => false
    t.boolean  "is_available",  :null => false
    t.integer  "nb_seat",       :null => false
    t.integer  "number_table",  :null => false
    t.integer  "employee_id",   :null => false
    t.integer  "restaurant_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tables", ["employee_id"], :name => "index_tables_on_employee_id"
  add_index "tables", ["restaurant_id"], :name => "index_tables_on_restaurant_id"

end
