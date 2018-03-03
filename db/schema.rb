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

ActiveRecord::Schema.define(version: 20170327202412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bootsy_image_galleries", id: :serial, force: :cascade do |t|
    t.string "bootsy_resource_type"
    t.integer "bootsy_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bootsy_resource_type", "bootsy_resource_id"], name: "bootsy_image_galleries_index"
  end

  create_table "bootsy_images", id: :serial, force: :cascade do |t|
    t.string "image_file"
    t.integer "image_gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_gallery_id"], name: "index_bootsy_images_on_image_gallery_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "meetup_id"
    t.string "name"
    t.integer "rsvp_limit"
    t.integer "status", default: 0
    t.datetime "time"
    t.datetime "created"
    t.string "link"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "venue"
  end

  create_table "offers", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_offers_on_sponsor_id"
  end

  create_table "sponsors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "offers", "sponsors"
end
