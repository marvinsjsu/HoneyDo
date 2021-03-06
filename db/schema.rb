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

ActiveRecord::Schema.define(version: 20140815234043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "title",      null: false
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["title"], name: "index_boards_on_title", using: :btree

  create_table "cards", force: true do |t|
    t.integer  "list_id",    null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["title"], name: "index_cards_on_title", using: :btree

  create_table "items", force: true do |t|
    t.integer  "card_id",     null: false
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["card_id"], name: "index_items_on_card_id", using: :btree
  add_index "items", ["name"], name: "index_items_on_name", using: :btree

  create_table "lists", force: true do |t|
    t.integer  "board_id",   null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["board_id"], name: "index_lists_on_board_id", using: :btree
  add_index "lists", ["title"], name: "index_lists_on_title", using: :btree

end
