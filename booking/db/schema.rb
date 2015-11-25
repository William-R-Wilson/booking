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

ActiveRecord::Schema.define(version: 20151125144037) do

  create_table "days", force: :cascade do |t|
    t.integer  "breakfast"
    t.integer  "lunch"
    t.integer  "dinner"
    t.integer  "dorm"
    t.integer  "hh"
    t.integer  "lodge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "visit_id"
    t.date     "date"
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
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "num_attendees"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "guest_id"
    t.boolean  "needs_projector"
    t.boolean  "needs_childcare"
    t.boolean  "needs_stafftime"
    t.boolean  "needs_supplies"
  end

end
