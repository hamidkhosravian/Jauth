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

ActiveRecord::Schema.define(version: 2018_10_27_185015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jauth_auth_tokens", force: :cascade do |t|
    t.string "token"
    t.string "refresh_token"
    t.bigint "jauth_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jauth_user_id"], name: "index_jauth_auth_tokens_on_jauth_user_id"
    t.index ["refresh_token"], name: "index_jauth_auth_tokens_on_refresh_token", unique: true
    t.index ["token"], name: "index_jauth_auth_tokens_on_token", unique: true
  end

  create_table "jauth_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "confirm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_jauth_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_jauth_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_jauth_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jauth_auth_tokens", "jauth_users"
end
