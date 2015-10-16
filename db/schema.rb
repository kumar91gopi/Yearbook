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

ActiveRecord::Schema.define(version: 20151015051124) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "educations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "institute"
    t.string   "field"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["profile_id"], name: "index_educations_on_profile_id"

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "occupations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "company"
    t.string   "position"
    t.string   "city"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "occupations", ["profile_id"], name: "index_occupations_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "city"
    t.text     "about_me"
    t.integer  "user_type",          default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "school_id"
    t.string   "gender"
    t.string   "profile_pic"
    t.string   "remote_profile_pic"
  end

  add_index "profiles", ["school_id"], name: "index_profiles_on_school_id"
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.text     "address"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "yearbook_id"
    t.text     "content"
    t.string   "image"
    t.boolean  "is_hidden",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "signatures", ["profile_id", "yearbook_id"], name: "index_signatures_on_profile_id_and_yearbook_id", unique: true
  add_index "signatures", ["profile_id"], name: "index_signatures_on_profile_id"
  add_index "signatures", ["yearbook_id", "created_at"], name: "index_signatures_on_yearbook_id_and_created_at"
  add_index "signatures", ["yearbook_id"], name: "index_signatures_on_yearbook_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
