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

ActiveRecord::Schema.define(version: 2019_05_11_142543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.bigint "daily_exchange_rate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_exchange_rate_id"], name: "index_currencies_on_daily_exchange_rate_id"
  end

  create_table "daily_exchange_rates", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.bigint "currency_id"
    t.decimal "middle_rate", precision: 10, scale: 5
    t.decimal "buying_spot_rate", precision: 10, scale: 5
    t.decimal "selling_spot_rate", precision: 10, scale: 5
    t.decimal "buying_cash_rate", precision: 10, scale: 5
    t.decimal "selling_cash_rate", precision: 10, scale: 5
    t.time "release_time"
    t.bigint "daily_exchange_rate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_exchange_rates_on_currency_id"
    t.index ["daily_exchange_rate_id"], name: "index_exchange_rates_on_daily_exchange_rate_id"
  end

  add_foreign_key "currencies", "daily_exchange_rates"
  add_foreign_key "exchange_rates", "currencies"
  add_foreign_key "exchange_rates", "daily_exchange_rates"
end
