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

ActiveRecord::Schema.define(version: 20180326021616) do

  create_table "bot_chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.text "ans_type", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saju_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "saju_bot_id"
    t.text "content"
    t.integer "next_bot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saju_bot_id"], name: "index_saju_answers_on_saju_bot_id"
  end

  create_table "saju_bots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.string "ans_type", collation: "latin1_swedish_ci"
    t.boolean "is_init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarot_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "tarot_bot_id"
    t.text "content"
    t.integer "next_bot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tarot_bot_id"], name: "index_tarot_answers_on_tarot_bot_id"
  end

  create_table "tarot_bots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "content"
    t.string "ans_type"
    t.boolean "is_init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.bigint "bot_chat_id"
    t.integer "next_bot_chat_id"
    t.string "ans_type", collation: "latin1_swedish_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bot_chat_id"], name: "index_user_chats_on_bot_chat_id"
  end

end
