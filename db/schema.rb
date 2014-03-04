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

ActiveRecord::Schema.define(version: 20140304211750) do

  create_table "bowls", force: true do |t|
    t.integer  "left_right"
    t.integer  "front_back"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "bottom_grid"
    t.boolean  "colander"
    t.integer  "specsheet_id"
  end

  create_table "specsheets", force: true do |t|
    t.string   "name"
    t.string   "bowl"
    t.string   "installation"
    t.string   "corner_radius"
    t.string   "drain_location"
    t.string   "drain_size"
    t.string   "divider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
