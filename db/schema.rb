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

ActiveRecord::Schema.define(:version => 20130225005052) do

  create_table "pages", :force => true do |t|
    t.integer  "site_id"
    t.integer  "duration",     :default => 0
    t.integer  "visit_counts", :default => 0
    t.text     "URL"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "sites", :force => true do |t|
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "url"
    t.integer  "visit_counts", :default => 0
    t.integer  "duration",     :default => 0
  end

  create_table "visits", :force => true do |t|
    t.text     "content"
    t.integer  "count",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.text     "url"
    t.integer  "duration",   :default => 0
    t.integer  "enter_time"
    t.integer  "leave_time"
    t.integer  "page_id"
  end

end
