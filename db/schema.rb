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

ActiveRecord::Schema.define(:version => 20121209162911) do

  create_table "androids", :force => true do |t|
    t.string   "sku"
    t.date     "data"
    t.integer  "daily_device_installs"
    t.integer  "active_device_installs"
    t.integer  "daily_user_installs"
    t.integer  "total_user_installs"
    t.integer  "active_user_installs"
    t.integer  "daily_device_uninstalls"
    t.integer  "daily_user_uninstalls"
    t.integer  "daily_device_upgrades"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "client_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "sku"
    t.datetime "last_sent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "downloads", :force => true do |t|
    t.string   "app"
    t.date     "data"
    t.integer  "android"
    t.integer  "iphone"
    t.integer  "uninstalls"
    t.integer  "total_android"
    t.integer  "total_iphone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "itunes", :force => true do |t|
    t.string   "sku"
    t.string   "title"
    t.integer  "units"
    t.date     "data"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "upgrades"
    t.integer  "client_id"
  end

  create_table "itunes_weeks", :force => true do |t|
    t.string   "sku"
    t.string   "title"
    t.integer  "units"
    t.integer  "upgrades"
    t.date     "date_start"
    t.date     "date_end"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "client_id"
  end

end
