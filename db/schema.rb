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

ActiveRecord::Schema.define(version: 20160429140214) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.string   "time"
    t.integer  "fee"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "people"
    t.integer  "service_hour"
    t.boolean  "paid",          default: false
    t.integer  "masseur"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "company"
    t.text     "remark"
    t.string   "contact_email"
    t.string   "username"
  end

  add_index "bookings", ["email"], name: "index_bookings_on_email"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "booking_id"
    t.string   "payment_method"
    t.integer  "amount"
    t.boolean  "paid",           default: false
    t.text     "params"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "payments", ["booking_id"], name: "index_payments_on_booking_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fb_uid"
    t.string   "fb_token"
    t.boolean  "admin"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
