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

ActiveRecord::Schema.define(version: 20150903120350) do

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",                   limit: 255
    t.string   "last_name",                    limit: 255
    t.datetime "dob"
    t.boolean  "male_gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_picture_file_name",    limit: 255
    t.string   "profile_picture_content_type", limit: 255
    t.integer  "profile_picture_file_size",    limit: 4
    t.datetime "profile_picture_updated_at"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school_name", limit: 255
    t.string   "city",        limit: 255
    t.string   "country",     limit: 255
    t.datetime "start"
    t.datetime "end"
    t.string   "faculty",     limit: 255
    t.string   "client_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "client_id",    limit: 255
    t.string   "company_name", limit: 255
    t.string   "position",     limit: 255
    t.datetime "started_on"
    t.datetime "ended_on"
    t.boolean  "current_job"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scratches", force: :cascade do |t|
    t.string   "client_id",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
