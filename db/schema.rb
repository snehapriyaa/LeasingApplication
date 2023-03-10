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

ActiveRecord::Schema.define(version: 2021_09_29_225938) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.date "start_date", null: false
    t.float "fee", null: false
    t.float "rent", null: false
    t.boolean "pets_allowed"
    t.boolean "in_unit_laundry"
    t.boolean "parking"
    t.string "terms_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "applicant_id"
    t.string "size", null: false
    t.index ["applicant_id"], name: "index_properties_on_applicant_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "property_id", null: false
    t.integer "applicant_id", null: false
    t.index ["applicant_id"], name: "index_requests_on_applicant_id"
    t.index ["property_id"], name: "index_requests_on_property_id"
  end

  create_table "waitlists", force: :cascade do |t|
    t.date "datetime"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "property_id", null: false
    t.integer "applicant_id", null: false
    t.index ["applicant_id"], name: "index_waitlists_on_applicant_id"
    t.index ["property_id"], name: "index_waitlists_on_property_id"
  end

  add_foreign_key "properties", "applicants"
  add_foreign_key "requests", "applicants"
  add_foreign_key "requests", "properties"
  add_foreign_key "waitlists", "applicants"
  add_foreign_key "waitlists", "properties"
end
