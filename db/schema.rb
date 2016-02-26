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

ActiveRecord::Schema.define(version: 20160226025800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.string   "role"
    t.integer  "invitable_id"
    t.string   "invitable_type"
    t.integer  "user_id"
    t.datetime "date_sent"
    t.datetime "date_accepted"
    t.string   "claim_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["invitable_id"], name: "index_invitations_on_invitable_id", using: :btree
  add_index "invitations", ["invitable_type"], name: "index_invitations_on_invitable_type", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "permalink"
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active",                                    default: true
    t.decimal  "weight",            precision: 8, scale: 3, default: 0.0
    t.decimal  "price",             precision: 8, scale: 3, default: 0.0
    t.decimal  "cost_price",        precision: 8, scale: 3, default: 0.0
    t.integer  "tax_rate_id"
    t.boolean  "featured",                                  default: false
    t.text     "in_the_box"
    t.boolean  "stock_control",                             default: true
    t.boolean  "default",                                   default: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "products", ["tax_rate_id"], name: "index_products_on_tax_rate_id", using: :btree

  create_table "tax_rates", force: :cascade do |t|
    t.string   "name"
    t.decimal  "rate",         precision: 8, scale: 2
    t.text     "country_ids"
    t.string   "address_type"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_admin"
    t.boolean  "is_sale_rep"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "products", "tax_rates"
end
