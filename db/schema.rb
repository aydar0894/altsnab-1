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

ActiveRecord::Schema.define(version: 20170705221642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",                              null: false
    t.integer  "parent_category_id"
    t.boolean  "is_leaf",            default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id", using: :btree
  end

  create_table "category_field_values", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "category_field_id"
    t.string   "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_field_id"], name: "index_category_field_values_on_category_field_id", using: :btree
    t.index ["item_id"], name: "index_category_field_values_on_item_id", using: :btree
  end

  create_table "category_fields", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "field_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_fields_on_category_id", using: :btree
    t.index ["field_id"], name: "index_category_fields_on_field_id", using: :btree
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description"
    t.integer  "category_id"
    t.integer  "price",              default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "juristic_documents", force: :cascade do |t|
    t.text     "company_full_name"
    t.text     "company_short_name"
    t.text     "ceo_name"
    t.text     "legal_address"
    t.text     "postal_address"
    t.text     "inn"
    t.text     "kpp"
    t.text     "ogrn"
    t.text     "okpo"
    t.text     "okato"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "count",      default: 1
    t.integer  "price",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_status_id"
    t.datetime "ordered_date"
    t.datetime "payed_date"
    t.datetime "completed_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payment_informations", force: :cascade do |t|
    t.text     "payment_account"
    t.text     "bank_name"
    t.text     "bik"
    t.text     "bank_correspondent_account"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "shipment_informations", force: :cascade do |t|
    t.text     "country"
    t.text     "city"
    t.text     "address"
    t.text     "zip_code"
    t.boolean  "is_main"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_shipment_informations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "role",                   default: "0"
    t.text     "middle_name"
    t.text     "last_name"
    t.integer  "juristic_document_id"
    t.integer  "payment_information_id"
    t.text     "first_name"
    t.text     "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["juristic_document_id"], name: "index_users_on_juristic_document_id", using: :btree
    t.index ["payment_information_id"], name: "index_users_on_payment_information_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "category_field_values", "category_fields"
  add_foreign_key "category_field_values", "items"
  add_foreign_key "category_fields", "categories"
  add_foreign_key "category_fields", "fields"
  add_foreign_key "items", "categories"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "shipment_informations", "users"
  add_foreign_key "users", "juristic_documents"
  add_foreign_key "users", "payment_informations"
end
