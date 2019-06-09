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

ActiveRecord::Schema.define(version: 2019_06_09_151209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estimates", force: :cascade do |t|
    t.integer "market_price"
    t.integer "rental_price"
    t.integer "roi_rate"
    t.integer "roi_price"
    t.integer "loan_payment"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_estimates_on_project_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "data"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["project_id"], name: "index_pictures_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "street_and_nr"
    t.integer "surface"
    t.integer "nr_of_bedrooms"
    t.string "category"
    t.integer "nr_of_bathrooms"
    t.string "state"
    t.integer "garage"
    t.boolean "terrace"
    t.boolean "heating"
    t.boolean "electricity"
    t.boolean "kitchen"
    t.boolean "sanitation"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "renovations", force: :cascade do |t|
    t.string "category"
    t.integer "price_per_unit"
    t.integer "quantity"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_renovations_on_project_id"
  end

  create_table "rental_markets", force: :cascade do |t|
    t.string "street_and_nr"
    t.integer "surface"
    t.integer "nr_of_bedrooms"
    t.integer "nr_of_bathrooms"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
  end

  create_table "sell_markets", force: :cascade do |t|
    t.string "street_and_nr"
    t.integer "surface"
    t.integer "nr_of_bedrooms"
    t.integer "nr_of_bathrooms"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zipcode"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "estimates", "projects"
  add_foreign_key "pictures", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "renovations", "projects"
end
