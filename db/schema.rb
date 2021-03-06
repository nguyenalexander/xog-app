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

ActiveRecord::Schema.define(version: 20150429222602) do

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals_tags", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "animals_tags", ["animal_id"], name: "index_animals_tags_on_animal_id"
  add_index "animals_tags", ["tag_id"], name: "index_animals_tags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
