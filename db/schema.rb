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

ActiveRecord::Schema.define(version: 2020_01_30_183502) do

  create_table "assignments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_assignments_on_group_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", default: "Waiting to be named.."
    t.string "project_status", default: "not assigned"
    t.integer "score"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "project_title"
    t.string "project_description"
    t.string "named"
    t.index ["course_id"], name: "index_groups_on_course_id"
  end

  create_table "instructor_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "citizen_id"
    t.string "instructor_id"
    t.string "department_name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_instructor_profiles_on_user_id"
  end

  create_table "student_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "citizen_id"
    t.string "student_id"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_student_profiles_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_subscriptions_on_course_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitor_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "citizen_id"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_visitor_profiles_on_user_id"
  end

  add_foreign_key "assignments", "groups"
  add_foreign_key "assignments", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "groups", "courses"
  add_foreign_key "instructor_profiles", "users"
  add_foreign_key "student_profiles", "users"
  add_foreign_key "subscriptions", "courses"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "visitor_profiles", "users"
end
