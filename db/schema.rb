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

ActiveRecord::Schema.define(version: 20170430210944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "raffle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_responses", force: :cascade do |t|
    t.integer  "message_responded_id"
    t.integer  "message_response_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numbers", force: :cascade do |t|
    t.integer  "number"
    t.integer  "raffle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "raffle_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "price_category_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "number_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raffle_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "raffles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.datetime "final_date"
    t.integer  "collected_money"
    t.integer  "user_id"
    t.integer  "raffle_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "response_id"
    t.integer  "responded_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "winners", force: :cascade do |t|
    t.integer  "number_id"
    t.integer  "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
