# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_081551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "clientName", default: ""
    t.string "clientSurName", default: ""
    t.string "clientNumber", default: ""
    t.bigint "specialist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialist_id"], name: "index_appointments_on_specialist_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "title", default: ""
    t.string "code", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "title", default: ""
    t.text "adress", default: ""
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title", default: ""
    t.integer "cost", default: 0
    t.integer "wminutes", default: 0
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  create_table "specialists", force: :cascade do |t|
    t.string "title", default: ""
    t.string "speciality", default: ""
    t.text "info", default: ""
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_specialists_on_service_id"
  end

  add_foreign_key "appointments", "specialists"
  add_foreign_key "companies", "cities"
  add_foreign_key "services", "companies"
  add_foreign_key "specialists", "services"
end
