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

ActiveRecord::Schema.define(version: 20141122061259) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "deliveries", force: true do |t|
    t.integer  "subscriber_id"
    t.integer  "prize_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliveries", ["prize_id"], name: "index_deliveries_on_prize_id"
  add_index "deliveries", ["subscriber_id"], name: "index_deliveries_on_subscriber_id"

  create_table "prizes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rule_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", force: true do |t|
    t.string   "numbers"
    t.integer  "before"
    t.integer  "after"
    t.integer  "prize_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rule_type_id"
  end

  add_index "rules", ["prize_id"], name: "index_rules_on_prize_id"
  add_index "rules", ["rule_type_id"], name: "index_rules_on_rule_type_id"

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.integer  "ticket_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
