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

ActiveRecord::Schema.define(version: 2019_04_02_105240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_admin_id"
    t.integer "status"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_app_users_on_user_id"
  end

  create_table "fcm_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "fcm_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fcm_users_on_user_id"
  end

  create_table "group_memberships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_memberships_on_group_id"
    t.index ["user_id"], name: "index_group_memberships_on_user_id"
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin_group", default: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "submission_attachments", id: :serial, force: :cascade do |t|
    t.integer "submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["submission_id"], name: "index_submission_attachments_on_submission_id"
  end

  create_table "submission_locations", id: :serial, force: :cascade do |t|
    t.integer "submission_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["submission_id"], name: "index_submission_locations_on_submission_id"
  end

  create_table "submissions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.jsonb "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_submissions_on_task_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "task_group_memberships", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_task_group_memberships_on_group_id"
    t.index ["task_id"], name: "index_task_group_memberships_on_task_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.jsonb "fields", default: "{}", null: false
    t.string "title", limit: 150, null: false
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fields"], name: "index_tasks_on_fields", using: :gin
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_locations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "user_type"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "user_status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "app_users", "users"
  add_foreign_key "group_memberships", "groups"
  add_foreign_key "group_memberships", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "submission_attachments", "submissions"
  add_foreign_key "submission_locations", "submissions"
  add_foreign_key "submissions", "tasks"
  add_foreign_key "submissions", "users"
  add_foreign_key "task_group_memberships", "tasks"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_locations", "users"
end
