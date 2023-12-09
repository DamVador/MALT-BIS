# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_08_091051) do
  create_table "conversations", force: :cascade do |t|
    t.text "last_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.integer "target_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "school"
    t.text "description"
    t.string "location"
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "profile_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.date "started_at"
    t.date "ended_at"
    t.text "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "profile_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "conversation_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "location"
    t.integer "price"
    t.string "experience"
    t.boolean "is_remote"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "skill_id"
  end

  add_foreign_key "conversations", "users", column: "owner_id"
  add_foreign_key "conversations", "users", column: "target_id"
  add_foreign_key "courses", "profiles"
  add_foreign_key "courses", "users"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "experiences", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "users", column: "owner_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "users_skills", "skills"
  add_foreign_key "users_skills", "users"
end
