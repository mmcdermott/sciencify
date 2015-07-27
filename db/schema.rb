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

ActiveRecord::Schema.define(version: 20150727035316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "metrics", force: :cascade do |t|
    t.integer  "creator_id",                  null: false
    t.integer  "frequency",   default: 1
    t.text     "description"
    t.boolean  "published",   default: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metrics", ["creator_id"], name: "index_metrics_on_creator_id", using: :btree

  create_table "numeric_data", force: :cascade do |t|
    t.integer  "question_id",                 null: false
    t.integer  "user_id",                     null: false
    t.float    "value"
    t.boolean  "anonymized",  default: false
    t.boolean  "public",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "numeric_data", ["question_id"], name: "index_numeric_data_on_question_id", using: :btree
  add_index "numeric_data", ["user_id"], name: "index_numeric_data_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "nickname"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "answer_type"
    t.text     "question"
    t.string   "input_label"
    t.integer  "metric_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["metric_id"], name: "index_questions_on_metric_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "metric_id",                       null: false
    t.integer  "user_id",                         null: false
    t.integer  "frequency",       default: 1
    t.date     "expiration_date"
    t.boolean  "public",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["metric_id"], name: "index_registrations_on_metric_id", using: :btree
  add_index "registrations", ["user_id", "metric_id"], name: "index_registrations_on_user_id_and_metric_id", unique: true, using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
