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

ActiveRecord::Schema.define(version: 2020_07_22_085620) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sound_id"
    t.integer "video_id"
    t.integer "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string "following"
    t.string "follower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashtag_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moods", force: :cascade do |t|
    t.string "mood_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "search_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.integer "user_id"
    t.string "genre"
    t.string "mood"
    t.string "hashtag"
    t.string "file"
    t.string "bpm"
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "genre_id"
    t.integer "mood_id"
    t.integer "hashtag_id"
    t.string "stage_source"
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "location"
    t.string "profile_image_id"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.integer "user_id"
    t.string "genre"
    t.string "mood"
    t.string "hashtag"
    t.string "file"
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
