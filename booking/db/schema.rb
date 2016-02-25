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

ActiveRecord::Schema.define(version: 20160225160449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cost_amounts", force: :cascade do |t|
    t.decimal  "overhead"
    t.decimal  "salary"
    t.decimal  "plate_cost"
    t.decimal  "payroll_tax"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.decimal  "labor_percentage"
    t.decimal  "supplies_percentage"
  end

  create_table "days", force: :cascade do |t|
    t.integer  "breakfast"
    t.integer  "lunch"
    t.integer  "dinner"
    t.integer  "dorm"
    t.integer  "hh"
    t.integer  "lodge"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "visit_id"
    t.date     "date"
    t.decimal  "hours"
    t.boolean  "waive_facility_rental"
  end

  create_table "employees", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.decimal "hourly"
  end

  create_table "guests", force: :cascade do |t|
    t.string   "email"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "name"
    t.string   "bill_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "telephone"
    t.text     "about"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "breakfast"
    t.decimal "lunch"
    t.decimal "dinner"
    t.decimal "dorm"
    t.decimal "horton"
    t.decimal "lodge"
    t.decimal "rentalfee"
    t.string  "tier"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "day_id"
    t.integer "employee_id"
    t.decimal "hours"
    t.time    "start_time"
    t.time    "end_time"
    t.integer "work_type_id"
  end

  create_table "services", force: :cascade do |t|
    t.string  "name"
    t.decimal "price"
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.integer  "num_attendees"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "guest_id"
    t.boolean  "needs_projector"
    t.boolean  "needs_childcare"
    t.boolean  "needs_stafftime"
    t.boolean  "needs_supplies"
    t.integer  "status"
    t.integer  "price_id"
    t.string   "price_tier"
    t.text     "purpose"
    t.text     "notes"
    t.boolean  "deposit_received"
    t.boolean  "agreement_signed"
  end

  add_index "visits", ["price_id"], name: "index_visits_on_price_id", using: :btree

  create_table "work_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "visits", "prices"
end
