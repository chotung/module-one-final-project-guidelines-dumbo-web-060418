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

ActiveRecord::Schema.define(version: 20180618185436) do

  create_table "armors", force: :cascade do |t|
    t.string  "name"
    t.integer "armor_value"
  end

  create_table "characters", force: :cascade do |t|
    t.string  "name"
    t.integer "strength",         default: 12
    t.integer "dexterity",        default: 12
    t.integer "constitution",     default: 12
    t.integer "hit_point",        default: 8
    t.integer "armor_value",      default: 10
    t.integer "experience_total", default: 0
    t.string  "main_hand"
    t.integer "player_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string  "name"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "hit_point"
    t.integer "armor_value"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
  end

  create_table "weapons", force: :cascade do |t|
    t.string  "name"
    t.integer "min_damage"
    t.integer "max_damage"
    t.integer "armor_value"
  end

end
