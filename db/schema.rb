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

ActiveRecord::Schema.define(version: 2020_03_03_090235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_attendances_on_lesson_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "course_periods", force: :cascade do |t|
    t.integer "day"
    t.bigint "course_id"
    t.bigint "period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_periods_on_course_id"
    t.index ["period_id"], name: "index_course_periods_on_period_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "faculty"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.bigint "school_id"
    t.boolean "archived", default: false
    t.integer "lessons_per_week", default: 1
    t.integer "weeks_per_course", default: 14
    t.string "class_number"
    t.string "class_type"
    t.bigint "faculty_id"
    t.string "classroom"
    t.index ["faculty_id"], name: "index_courses_on_faculty_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["school_id"], name: "index_faculties_on_school_id"
  end

  create_table "grade_sections", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.bigint "enrollment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_id"], name: "index_grade_sections_on_enrollment_id"
  end

  create_table "lesson_sections", force: :cascade do |t|
    t.string "goal"
    t.interval "duration"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_sections_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.text "objective"
    t.datetime "date", default: "2020-02-14 03:06:08"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.interval "duration"
    t.bigint "course_id"
    t.bigint "course_period_id"
    t.boolean "holiday", default: false
    t.integer "week"
    t.bigint "lessons_schedules_id"
    t.boolean "started", default: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["course_period_id"], name: "index_lessons_on_course_period_id"
    t.index ["lessons_schedules_id"], name: "index_lessons_on_lessons_schedules_id"
  end

  create_table "lessons_schedules", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_lessons_schedules_on_course_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "period_number"
    t.time "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "faculty_id"
    t.integer "minutes"
    t.index ["faculty_id"], name: "index_periods_on_faculty_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "campus"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "given_name"
    t.string "family_name"
    t.string "student_number"
    t.string "gender"
    t.string "photo"
    t.string "given_name_furigana"
    t.string "family_name_furigana"
    t.string "given_name_kanji"
    t.string "family_name_kanji"
    t.string "year_enrolled"
    t.string "faculty"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.date "due_date"
    t.bigint "attendance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_id"], name: "index_tasks_on_attendance_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "given_name"
    t.string "family_name"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendances", "lessons"
  add_foreign_key "attendances", "students"
  add_foreign_key "course_periods", "courses"
  add_foreign_key "course_periods", "periods"
  add_foreign_key "courses", "faculties"
  add_foreign_key "courses", "schools"
  add_foreign_key "courses", "users"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "faculties", "schools"
  add_foreign_key "grade_sections", "enrollments"
  add_foreign_key "lesson_sections", "lessons"
  add_foreign_key "lessons", "course_periods"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "lessons_schedules", column: "lessons_schedules_id"
  add_foreign_key "lessons_schedules", "courses"
  add_foreign_key "periods", "faculties"
  add_foreign_key "tasks", "attendances"
end
