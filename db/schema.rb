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

ActiveRecord::Schema.define(version: 2019_10_14_090654) do

  create_table "importers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "csv"
  end

  create_table "keywords", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "site_id", null: false
    t.string "keyword"
    t.string "market"
    t.integer "device"
    t.date "created_at"
    t.index ["site_id"], name: "index_keywords_on_site_id"
  end

  create_table "rankings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "keyword_id", null: false
    t.date "date_ranked", null: false
    t.integer "google"
    t.integer "google_base"
    t.integer "yahoo"
    t.integer "bing"
    t.integer "gsv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["keyword_id"], name: "index_rankings_on_keyword_id"
  end

  create_table "sites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "site"
    t.date "created_at"
  end

  add_foreign_key "keywords", "sites"
  add_foreign_key "rankings", "keywords"
end
