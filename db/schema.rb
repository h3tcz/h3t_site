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

ActiveRecord::Schema.define(version: 20150422184447) do

  create_table "pictures", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "project_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "pictures", ["project_id"], name: "index_pictures_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "slug_cz",         limit: 255
    t.string   "slug_en",         limit: 255
    t.string   "title_cz",        limit: 255
    t.string   "title_en",        limit: 255
    t.integer  "year",            limit: 4
    t.string   "location_cz",     limit: 255
    t.string   "location_en",     limit: 255
    t.string   "collaborator_cz", limit: 255
    t.string   "collaborator_en", limit: 255
    t.text     "content_cz",      limit: 65535
    t.text     "content_en",      limit: 65535
    t.boolean  "published",       limit: 1,     default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "static_pages", force: :cascade do |t|
    t.string   "slug_cz",    limit: 255
    t.string   "title_cz",   limit: 255
    t.text     "content_cz", limit: 65535
    t.string   "slug_en",    limit: 255
    t.string   "title_en",   limit: 255
    t.text     "content_en", limit: 65535
    t.boolean  "published",  limit: 1,     default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "project_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "taggings", ["project_id"], name: "index_taggings_on_project_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "pictures", "projects"
  add_foreign_key "taggings", "projects"
  add_foreign_key "taggings", "tags"
end
