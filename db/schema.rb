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

ActiveRecord::Schema.define(version: 20150617171923) do

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 12, scale: 3
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "purchase_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_products", ["product_id"], name: "index_purchase_products_on_product_id"
  add_index "purchase_products", ["purchase_id"], name: "index_purchase_products_on_purchase_id"

  create_table "purchases", force: true do |t|
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "tax",        precision: 12, scale: 3
    t.decimal  "shipping",   precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "approved"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
