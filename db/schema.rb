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

ActiveRecord::Schema.define(version: 20180228100331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crypto_pairs", force: :cascade do |t|
    t.text "name"
    t.decimal "value"
    t.datetime "on_time"
    t.bigint "exchange_id"
    t.index ["exchange_id"], name: "index_crypto_pairs_on_exchange_id"
    t.index ["name", "on_time"], name: "index_crypto_pairs_on_name_and_on_time"
  end

  create_table "exchanges", force: :cascade do |t|
    t.text "short_name"
    t.text "name"
    t.index ["short_name"], name: "index_exchanges_on_short_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "crypto_pairs", "exchanges"
end
