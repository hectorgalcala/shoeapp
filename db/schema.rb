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

ActiveRecord::Schema.define(version: 20150112144538) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "chars_orders", force: :cascade do |t|
    t.integer  "chars_id",   limit: 4
    t.integer  "order_id",   limit: 4
    t.integer  "quantity",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "chars_orders", ["chars_id", "order_id"], name: "index_chars_orders_on_chars_id_and_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "tracking_no", limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "status",      limit: 4
    t.float    "total_price", limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "orders", ["tracking_no"], name: "index_orders_on_tracking_no", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "product_characteristics", force: :cascade do |t|
    t.float    "price",      limit: 24
    t.integer  "size",       limit: 4
    t.string   "color",      limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "product_id", limit: 4
    t.string   "slug",       limit: 255
  end

  add_index "product_characteristics", ["product_id"], name: "index_product_characteristics_on_product_id", using: :btree
  add_index "product_characteristics", ["slug"], name: "index_product_characteristics_on_slug", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "mod_name",         limit: 255
    t.text     "description",      limit: 65535
    t.string   "sku",              limit: 255
    t.boolean  "status",           limit: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "position",         limit: 4
    t.string   "slug",             limit: 255
    t.string   "meta_keywords",    limit: 255
    t.string   "meta_description", limit: 255
  end

  add_index "products", ["position"], name: "index_products_on_position", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitors", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.integer  "visits",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "website_settings", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.string   "website_url",            limit: 255
    t.string   "email",                  limit: 255
    t.string   "url",                    limit: 255
    t.string   "meta_keyword",           limit: 255
    t.string   "meta_description",       limit: 255
    t.string   "stripe_secret_key",      limit: 255
    t.string   "stripe_publishable_key", limit: 255
    t.string   "upload_path",            limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
