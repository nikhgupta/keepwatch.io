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

ActiveRecord::Schema.define(version: 20150409131553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "profile_id"
    t.string   "token"
    t.string   "secret"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authentications", ["profile_id"], name: "index_authentications_on_profile_id", using: :btree
  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "tracker_id"
    t.integer  "loggable_id"
    t.string   "loggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "logs", ["tracker_id"], name: "index_logs_on_tracker_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "identifier"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profiles", ["provider_id"], name: "index_profiles_on_provider_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackables", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "type"
    t.boolean  "auth_dependent"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trackables", ["provider_id"], name: "index_trackables_on_provider_id", using: :btree

  create_table "trackers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.integer  "profile_id"
    t.integer  "trackable_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "trackers", ["campaign_id"], name: "index_trackers_on_campaign_id", using: :btree
  add_index "trackers", ["profile_id"], name: "index_trackers_on_profile_id", using: :btree
  add_index "trackers", ["trackable_id"], name: "index_trackers_on_trackable_id", using: :btree
  add_index "trackers", ["user_id"], name: "index_trackers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "authentications", "profiles"
  add_foreign_key "authentications", "users"
  add_foreign_key "campaigns", "users"
  add_foreign_key "logs", "trackers"
  add_foreign_key "profiles", "providers"
  add_foreign_key "trackables", "providers"
  add_foreign_key "trackers", "campaigns"
  add_foreign_key "trackers", "profiles"
  add_foreign_key "trackers", "trackables"
  add_foreign_key "trackers", "users"
end
