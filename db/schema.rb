# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_06_061133) do

  create_table "graphickers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "token_digest"
    t.integer "image_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"token\"", name: "index_graphickers_on_token", unique: true
    t.index ["image_id"], name: "index_graphickers_on_image_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "graphicker_id", null: false
    t.string "tag", null: false
    t.binary "data", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["graphicker_id"], name: "index_images_on_graphicker_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "graphicker_id", null: false
    t.string "title", null: false
    t.text "show", null: false
    t.integer "image_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["graphicker_id"], name: "index_portfolios_on_graphicker_id"
    t.index ["image_id"], name: "index_portfolios_on_image_id"
  end

  add_foreign_key "graphickers", "images"
  add_foreign_key "images", "graphickers"
  add_foreign_key "portfolios", "graphickers"
  add_foreign_key "portfolios", "images"
end
