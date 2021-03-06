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

ActiveRecord::Schema.define(version: 20161031110825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer  "raver_id"
    t.string   "competance"
    t.string   "motivation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.json     "portfolios"
    t.string   "pagelink"
    t.string   "language"
    t.string   "availability"
    t.string   "car"
  end

  add_index "applications", ["raver_id"], name: "index_applications_on_raver_id", using: :btree

  create_table "guestlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "number",     default: 1
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ravers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "town"
    t.string   "phone"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "gender"
    t.string   "street"
    t.string   "zipcode"
    t.datetime "last_seen"
    t.json     "portfolios"
    t.string   "region",                 default: "TUNISIA"
  end

  add_index "ravers", ["email"], name: "index_ravers_on_email", unique: true, using: :btree
  add_index "ravers", ["reset_password_token"], name: "index_ravers_on_reset_password_token", unique: true, using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "code"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "applications", "ravers"
end
