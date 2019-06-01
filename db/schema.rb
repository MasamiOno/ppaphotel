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

ActiveRecord::Schema.define(version: 2019_05_31_070520) do

  create_table "alerts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.string "petname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_alerts_on_room_id"
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "cuties", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "floors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "floorname"
    t.index ["floorname"], name: "index_floors_on_floorname", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.string "comment"
    t.string "rentname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "petname"
    t.index ["room_id"], name: "index_notes_on_room_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "cutie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roomnumber"
    t.string "frame01"
    t.string "frame02"
    t.string "frame03"
    t.string "frame04"
    t.string "frame05"
    t.string "rentname"
    t.string "rentcomment"
    t.integer "owner_id"
    t.integer "roomcounter", default: 5
    t.string "ownername"
    t.string "frame06"
    t.string "frame07"
    t.string "frm01comment"
    t.string "frm02comment"
    t.string "frm03comment"
    t.string "frm04comment"
    t.string "frm05comment"
    t.string "frm06comment"
    t.string "frm07comment"
    t.string "roomface"
    t.string "frame08"
    t.string "frame09"
    t.string "frame10"
    t.string "petname"
    t.index ["rentname"], name: "index_rooms_on_rentname", unique: true
    t.index ["roomnumber"], name: "index_rooms_on_roomnumber", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "roomcounter", default: 2
    t.integer "rmcounter", default: 3
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
