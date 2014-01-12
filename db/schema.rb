# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140112031700) do

  create_table "bowlers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",      null: false
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bowlers", ["email"], name: "index_bowlers_on_email", unique: true
  add_index "bowlers", ["team_id"], name: "index_bowlers_on_team_id"

  create_table "leagues", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.integer  "weeks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "score"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["series_id"], name: "index_scores_on_series_id"

  create_table "series", force: true do |t|
    t.integer  "bowler_id"
    t.integer  "league_id"
    t.integer  "team_id"
    t.integer  "week"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series", ["bowler_id"], name: "index_series_on_bowler_id"
  add_index "series", ["league_id"], name: "index_series_on_league_id"
  add_index "series", ["team_id"], name: "index_series_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id"

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "picture"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
