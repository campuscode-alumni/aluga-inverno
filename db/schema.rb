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

ActiveRecord::Schema.define(version: 20170718230130) do

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "cpf"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "prices", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.float "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_prices_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "maximum_guests"
    t.integer "minimum_rent"
    t.integer "maximum_rent"
    t.decimal "daily_rate"
    t.string "property_type"
    t.string "property_location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "owner"
    t.string "email"
    t.string "phone"
    t.string "rules"
    t.integer "owner_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
  end

  create_table "property_purposes", force: :cascade do |t|
    t.integer "property_id"
    t.integer "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_purposes_on_property_id"
    t.index ["purpose_id"], name: "index_property_purposes_on_purpose_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.decimal "total_amount"
    t.integer "total_guests"
    t.string "rent_purpose"
    t.text "extra_info"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "accept", default: 0
    t.date "accepted_at"
    t.index ["property_id"], name: "index_proposals_on_property_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "property_id"
    t.integer "user_id"
    t.integer "rate"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_reviews_on_property_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "cpf"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
