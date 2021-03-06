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

ActiveRecord::Schema.define(version: 2020_02_02_104659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "civics", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "effects"
    t.string "group"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empires", force: :cascade do |t|
    t.string "name"
    t.bigint "species_id", null: false
    t.bigint "government_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["government_id"], name: "index_empires_on_government_id"
    t.index ["species_id"], name: "index_empires_on_species_id"
  end

  create_table "ethics", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "value"
    t.string "effects"
    t.string "category"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "government_civics", force: :cascade do |t|
    t.bigint "government_id", null: false
    t.bigint "civic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["civic_id"], name: "index_government_civics_on_civic_id"
    t.index ["government_id"], name: "index_government_civics_on_government_id"
  end

  create_table "government_ethics", force: :cascade do |t|
    t.bigint "government_id", null: false
    t.bigint "ethic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ethic_id"], name: "index_government_ethics_on_ethic_id"
    t.index ["government_id"], name: "index_government_ethics_on_government_id"
  end

  create_table "governments", force: :cascade do |t|
    t.string "authority"
    t.string "icon"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "homeworlds", force: :cascade do |t|
    t.string "name"
    t.bigint "species_id", null: false
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["species_id"], name: "index_homeworlds_on_species_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.text "effects"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.string "archetype"
    t.string "portrait"
    t.bigint "origin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["origin_id"], name: "index_species_on_origin_id"
  end

  create_table "species_traits", force: :cascade do |t|
    t.bigint "species_id", null: false
    t.bigint "trait_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["species_id"], name: "index_species_traits_on_species_id"
    t.index ["trait_id"], name: "index_species_traits_on_trait_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.integer "value"
    t.string "effects"
    t.text "description"
    t.string "category"
    t.string "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "empires", "governments"
  add_foreign_key "empires", "species"
  add_foreign_key "government_civics", "civics"
  add_foreign_key "government_civics", "governments"
  add_foreign_key "government_ethics", "ethics"
  add_foreign_key "government_ethics", "governments"
  add_foreign_key "homeworlds", "species"
  add_foreign_key "species", "origins"
  add_foreign_key "species_traits", "species"
  add_foreign_key "species_traits", "traits"
end
