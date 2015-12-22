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

ActiveRecord::Schema.define(version: 20151221113920) do

  create_table "appointments", force: :cascade do |t|
    t.date     "date_of_visit",           null: false
    t.integer  "pet_id",                  null: false
    t.integer  "customer_id",             null: false
    t.string   "reminder_of_appointment", null: false
    t.string   "reason_for_visit",        null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name_of_pet",        limit: 35, null: false
    t.string   "type_of_pet",                   null: false
    t.string   "breed",              limit: 35, null: false
    t.integer  "age",                           null: false
    t.float    "weight",                        null: false
    t.date     "date_of_last_visit"
    t.integer  "user_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "", null: false
    t.string   "encrypted_password",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                                               null: false
    t.integer  "role"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip",                         limit: 5
    t.string   "school_received_degree_from"
    t.integer  "years_in_practice"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
