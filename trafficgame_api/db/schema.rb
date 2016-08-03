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

ActiveRecord::Schema.define(version: 20160730165023) do

  create_table "answers", primary_key: ["id", "question_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "id",                        null: false
    t.integer  "question_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "answer",      limit: 65535
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edgemeta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "edge_id"
    t.integer  "mode_id"
    t.integer  "condition_id"
    t.float    "cost",         limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "edges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "distance",   limit: 24
    t.integer  "startnode"
    t.integer  "endnode"
    t.integer  "routeid"
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "condition_id"
    t.integer  "travel_mod"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "origin"
    t.integer  "destination"
    t.float    "budget",           limit: 24
    t.float    "travel_time",      limit: 24
    t.text     "current_loc_type", limit: 65535
    t.integer  "location_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "games_hist", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "condition_id"
    t.integer  "travel_mod"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "origin"
    t.integer  "destination"
    t.float    "budget",           limit: 24
    t.float    "travel_time",      limit: 24
    t.text     "current_loc_type", limit: 65535
    t.integer  "location_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  create_table "nodequestions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "node_id"
    t.integer  "question_id"
  end

  create_table "nodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "desc"
    t.float    "lat",        limit: 24
    t.float    "lon",        limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "answer_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "travelmodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userfeeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "usert",       limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
