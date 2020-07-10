# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_10_040217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "topic_type"
    t.bigint "topic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_type", "topic_id"], name: "index_chatrooms_on_topic_type_and_topic_id"
  end

  create_table "completion_messages", force: :cascade do |t|
    t.bigint "milestone_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["milestone_id"], name: "index_completion_messages_on_milestone_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "buddy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buddy_id"], name: "index_connections_on_buddy_id"
    t.index ["owner_id"], name: "index_connections_on_owner_id"
  end

  create_table "goal_connections", force: :cascade do |t|
    t.bigint "connection_id", null: false
    t.bigint "goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connection_id"], name: "index_goal_connections_on_connection_id"
    t.index ["goal_id"], name: "index_goal_connections_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.date "deadline"
    t.float "progress", default: 0.0
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "start_date", default: "2020-07-08"
    t.string "icon", default: "<i class='fa fa-trophy'></i>"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.string "name"
    t.date "deadline"
    t.boolean "is_completed", default: false
    t.integer "weightage", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_milestones_on_goal_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "completion_messages", "milestones"
  add_foreign_key "goal_connections", "connections"
  add_foreign_key "goal_connections", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "milestones", "goals"
end
