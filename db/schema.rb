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

ActiveRecord::Schema.define(version: 2020_08_07_050641) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sound_id"
    t.integer "video_id"
    t.integer "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtag_sounds", force: :cascade do |t|
    t.integer "sound_id"
    t.integer "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id"], name: "index_hashtag_sounds_on_hashtag_id"
    t.index ["sound_id"], name: "index_hashtag_sounds_on_sound_id"
  end

  create_table "hashtag_stages", force: :cascade do |t|
    t.integer "stage_id"
    t.integer "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id"], name: "index_hashtag_stages_on_hashtag_id"
    t.index ["stage_id"], name: "index_hashtag_stages_on_stage_id"
  end

  create_table "hashtag_videos", force: :cascade do |t|
    t.integer "video_id"
    t.integer "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_id"], name: "index_hashtag_videos_on_hashtag_id"
    t.index ["video_id"], name: "index_hashtag_videos_on_video_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashtag_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag_word"], name: "index_hashtags_on_hashtag_word", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "sound_id"
    t.integer "video_id"
    t.integer "stage_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sound_id"], name: "index_notifications_on_sound_id"
    t.index ["stage_id"], name: "index_notifications_on_stage_id"
    t.index ["video_id"], name: "index_notifications_on_video_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "sound_sources", force: :cascade do |t|
    t.integer "user_id"
    t.integer "video_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.integer "user_id"
    t.string "genre"
    t.text "hashbody"
    t.string "file"
    t.string "bpm"
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", force: :cascade do |t|
    t.integer "user_id"
    t.string "genre"
    t.text "hashbody"
    t.string "file"
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
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

  create_table "video_sources", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sound_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer "user_id"
    t.string "genre"
    t.text "hashbody"
    t.string "file"
    t.string "title"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
  end

end
