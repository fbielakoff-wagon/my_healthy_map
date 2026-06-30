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

ActiveRecord::Schema[8.1].define(version: 2026_06_30_100645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "health_goal_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["health_goal_id"], name: "index_chats_on_health_goal_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "health_goals", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.string "module"
    t.string "name"
    t.text "system_prompt"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_health_goals_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "attachment_url"
    t.bigint "chat_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chats", "health_goals"
  add_foreign_key "chats", "users"
  add_foreign_key "health_goals", "users"
  add_foreign_key "messages", "chats"
end
