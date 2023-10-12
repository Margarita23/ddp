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

ActiveRecord::Schema[7.0].define(version: 2023_10_12_141848) do
  create_table "commission_assignments", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "commission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commission_id"], name: "index_commission_assignments_on_commission_id"
    t.index ["teacher_id"], name: "index_commission_assignments_on_teacher_id"
  end

  create_table "commissions", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "head_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "eval_method_id"
  end

  create_table "defense_processes", force: :cascade do |t|
    t.string "nameID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_defense_processes_on_user_id"
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "theme"
    t.integer "pages"
    t.integer "presentation"
    t.string "language", default: "українською", null: false
    t.integer "student_id", null: false
    t.integer "mark"
    t.string "sample_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_diplomas_on_student_id"
  end

  create_table "eval_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "form"
    t.string "specialization"
    t.string "name_number"
    t.integer "specialty_code"
    t.string "specialty_title"
    t.string "degree"
    t.integer "defense_process_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commission_id"
    t.index ["commission_id"], name: "index_groups_on_commission_id"
    t.index ["defense_process_id"], name: "index_groups_on_defense_process_id"
  end

  create_table "marks", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "mark"
    t.integer "diploma_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diploma_id"], name: "index_marks_on_diploma_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_protocols_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "text"
    t.integer "diploma_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diploma_id"], name: "index_questions_on_diploma_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "name"
    t.integer "eval_method_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eval_method_id"], name: "index_ratings_on_eval_method_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name"
    t.string "theme"
    t.date "date"
    t.string "gender", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id", null: false
    t.integer "commission_id"
    t.index ["commission_id"], name: "index_students_on_commission_id"
    t.index ["group_id"], name: "index_students_on_group_id"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.string "academic_status"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commission_assignments", "commissions"
  add_foreign_key "commission_assignments", "teachers"
  add_foreign_key "defense_processes", "users"
  add_foreign_key "diplomas", "students"
  add_foreign_key "groups", "commissions"
  add_foreign_key "groups", "defense_processes"
  add_foreign_key "marks", "diplomas"
  add_foreign_key "protocols", "students"
  add_foreign_key "questions", "diplomas"
  add_foreign_key "ratings", "eval_methods"
  add_foreign_key "students", "commissions"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "teachers"
end
