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

ActiveRecord::Schema.define(version: 20190322144411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodies", force: :cascade do |t|
    t.string "type"
    t.string "content"
    t.integer "number"
    t.bigint "sentence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sentence_id"], name: "index_bodies_on_sentence_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "content"
    t.bigint "sentence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sentence_id"], name: "index_feedbacks_on_sentence_id"
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo"
    t.bigint "sentence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sentence_id"], name: "index_responsibles_on_sentence_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.string "name"
    t.string "entry_point"
    t.string "type"
    t.date "date"
    t.string "institution"
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

  add_foreign_key "bodies", "sentences"
  add_foreign_key "feedbacks", "sentences"
  add_foreign_key "responsibles", "sentences"
end