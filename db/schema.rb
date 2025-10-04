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

ActiveRecord::Schema[8.0].define(version: 2025_10_04_152518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "interview_id", null: false
    t.bigint "material_id", null: false
    t.bigint "question_id", null: false
    t.text "value"
    t.string "response_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_answers_on_interview_id"
    t.index ["material_id"], name: "index_answers_on_material_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "batch_materials", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.bigint "material_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_batch_materials_on_batch_id"
    t.index ["material_id"], name: "index_batch_materials_on_material_id"
  end

  create_table "batch_questions", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.bigint "question_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_batch_questions_on_batch_id"
    t.index ["question_id"], name: "index_batch_questions_on_question_id"
  end

  create_table "batches", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviewees", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.bigint "interviewee_id", null: false
    t.bigint "batch_id", null: false
    t.datetime "interview_date"
    t.text "notes"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_interviews_on_batch_id"
    t.index ["interviewee_id"], name: "index_interviews_on_interviewee_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "material_type"
    t.string "base"
    t.string "fragrance"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "text"
    t.string "question_type"
    t.text "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "interviews"
  add_foreign_key "answers", "materials"
  add_foreign_key "answers", "questions"
  add_foreign_key "batch_materials", "batches"
  add_foreign_key "batch_materials", "materials"
  add_foreign_key "batch_questions", "batches"
  add_foreign_key "batch_questions", "questions"
  add_foreign_key "interviews", "batches"
  add_foreign_key "interviews", "interviewees"
end
