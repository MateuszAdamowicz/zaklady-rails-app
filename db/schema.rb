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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130821154428) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status"
  end

  create_table "obstawienies", :force => true do |t|
    t.integer  "zaklad_id"
    t.integer  "user_id"
    t.integer  "opcja"
    t.integer  "reputacja"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "wygrana"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "zaklads", :force => true do |t|
    t.datetime "data"
    t.string   "gospodarz"
    t.string   "gosc"
    t.float    "k1"
    t.float    "k2"
    t.float    "k3"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "event_id"
    t.integer  "wynik"
  end

end
