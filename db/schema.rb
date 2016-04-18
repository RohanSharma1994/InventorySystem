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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160418200146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "deleted"
  end

  create_table "items", force: :cascade do |t|
    t.text     "description"
    t.integer  "quantity"
    t.integer  "item_number_one"
    t.integer  "item_number_two"
    t.float    "price"
    t.float    "retail_price"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "customer_id"
    t.boolean  "deleted"
    t.string   "name"
    t.string   "photo_path"
    t.integer  "sale_id"
  end

  add_index "items", ["customer_id"], name: "index_items_on_customer_id", using: :btree
  add_index "items", ["sale_id"], name: "index_items_on_sale_id", using: :btree

  create_table "sale_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "price_per_item"
    t.float    "total_price"
    t.integer  "item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "sale_id"
  end

  add_index "sale_items", ["sale_id"], name: "index_sale_items_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_id"
    t.float    "amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "transaction_type"
    t.float    "deposit_amount"
    t.string   "reference_number"
    t.string   "sale_status"
  end

  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.boolean  "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "admin"
  end

  add_foreign_key "items", "customers"
  add_foreign_key "items", "sales"
  add_foreign_key "sale_items", "sales"
  add_foreign_key "sales", "customers"
end
