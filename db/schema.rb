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

ActiveRecord::Schema.define(version: 20170627170136) do

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
    t.string   "name",                    null: false
    t.text     "description"
    t.integer  "category_id"
    t.integer  "price",       default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "category_field_values", "category_fields"
  add_foreign_key "category_field_values", "items"
  add_foreign_key "category_fields", "categories"
  add_foreign_key "category_fields", "fields"
  add_foreign_key "items", "categories"
end
