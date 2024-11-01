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

ActiveRecord::Schema[7.2].define(version: 2024_10_25_180155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "student_subjects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "s_name"
    t.string "s_student_name"
    t.integer "s_mark"
    t.string "user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "u_name"
    t.string "u_user_name"
    t.text "password"
    t.text "u_role", default: "student"
    t.text "password_digest"
    t.text "confirm_password"
    t.uuid "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_users_on_created_by_id"
  end

  add_foreign_key "users", "users", column: "created_by_id"
end
