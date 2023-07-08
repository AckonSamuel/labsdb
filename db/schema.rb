# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_06_200454) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "category_name"
    t.string "category_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instrument_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "instrument_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_instrument_categories_on_category_id"
    t.index ["instrument_id"], name: "index_instrument_categories_on_instrument_id"
  end

  create_table "instrument_labs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "instrument_id", null: false
    t.uuid "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_instrument_labs_on_instrument_id"
    t.index ["lab_id"], name: "index_instrument_labs_on_lab_id"
  end

  create_table "instrumentdetails", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "range"
    t.string "resolution"
    t.integer "accuracy"
    t.uuid "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_instrumentdetails_on_instrument_id"
  end

  create_table "instruments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "instrument_name"
    t.integer "manufacturing_year"
    t.integer "number_of_devices"
    t.string "description"
    t.integer "price"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "lab_name"
    t.string "lab_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "jti", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "vendor_name"
    t.string "location"
    t.string "email"
    t.string "website"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "instrument_categories", "categories"
  add_foreign_key "instrument_categories", "instruments"
  add_foreign_key "instrument_labs", "instruments"
  add_foreign_key "instrument_labs", "labs"
  add_foreign_key "instrumentdetails", "instruments"
end
