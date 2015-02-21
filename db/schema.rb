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

ActiveRecord::Schema.define(version: 20150216152619) do

  create_table "colleges", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "country",       limit: 255
    t.integer  "sat_min_score", limit: 4
    t.integer  "sat_max_score", limit: 4
    t.decimal  "tuition_fees",              precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "sex",        limit: 255
    t.integer  "age",        limit: 4
    t.date     "dob"
    t.text     "bio",        limit: 65535
    t.text     "image",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "sex",            limit: 255
    t.integer  "age",            limit: 4
    t.date     "dob"
    t.string   "current_school", limit: 255
    t.string   "current_level",  limit: 255
    t.string   "country",        limit: 255
    t.integer  "sat_score",      limit: 4
    t.integer  "mentor_id",      limit: 4
    t.integer  "college_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "students", ["mentor_id"], name: "index_students_on_mentor_id", using: :btree

  add_foreign_key "students", "mentors"
end
