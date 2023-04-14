# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_14_172406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_campaigns_on_title", unique: true
  end

  create_table "campaigns_players", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id", "player_id"], name: "index_campaigns_players_on_unique", unique: true
    t.index ["campaign_id"], name: "index_campaigns_players_on_campaign_id"
    t.index ["player_id"], name: "index_campaigns_players_on_player_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "version", default: 1, null: false
    t.text "origin_story"
    t.integer "player_id"
    t.integer "campaign_id"
    t.integer "age"
    t.string "gender"
    t.string "size", null: false
    t.string "species", null: false
    t.float "height"
    t.float "weight"
    t.integer "experience"
    t.integer "strength", null: false
    t.integer "agility", null: false
    t.integer "health", null: false
    t.integer "reasoning", null: false
    t.integer "memory", null: false
    t.integer "intuition", null: false
    t.integer "beauty", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["player_id"], name: "index_characters_on_player_id"
  end

  create_table "characters_feats", force: :cascade do |t|
    t.integer "feat_id", null: false
    t.integer "character_id", null: false
    t.text "backstory"
    t.json "modifications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_feats_on_character_id"
    t.index ["feat_id"], name: "index_character_feats_on_feat_id"
  end

  create_table "characters_flaws", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "flaw_id", null: false
    t.integer "permanence", default: 3
    t.text "backstory"
    t.json "modifications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_flaws_on_character_id"
    t.index ["flaw_id"], name: "index_character_flaws_on_flaw_id"
  end

  create_table "characters_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "skill_id", null: false
    t.integer "trained_level"
    t.text "backstory"
    t.json "modifications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "characters_specializations", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "specialization_id", null: false
    t.integer "trained_levels", default: 1, null: false
    t.text "backstory"
    t.json "modifications"
    t.index ["character_id", "specialization_id"], name: "index_char_spec_on_unique_fields", unique: true
    t.index ["specialization_id"], name: "index_char_spec_on_spec_id"
  end

  create_table "characters_spells", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "spell_id", null: false
    t.text "backstory"
    t.json "modifications"
    t.index ["character_id", "spell_id"], name: "index_char_spells_on_unique_fields", unique: true
    t.index ["spell_id"], name: "index_char_spells_on_spell_id"
  end

  create_table "characters_virtues", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "virtue_id", null: false
    t.integer "permanence", default: 3
    t.text "backstory"
    t.json "modifications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_virtues_on_character_id"
    t.index ["virtue_id"], name: "index_character_virtues_on_virtue_id"
  end

  create_table "feats", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "modify_ac", default: 0
    t.integer "modify_hp", default: 0
    t.integer "modify_age", default: 0
    t.integer "modify_stamina", default: 0
    t.integer "modify_strength", default: 0
    t.integer "modify_agility", default: 0
    t.integer "modify_health", default: 0
    t.integer "modify_reasoning", default: 0
    t.integer "modify_memory", default: 0
    t.integer "modify_intuition", default: 0
    t.integer "modify_beauty", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flaws", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "magnitude"
    t.integer "modify_ac", default: 0
    t.integer "modify_hp", default: 0
    t.integer "modify_age", default: 0
    t.integer "modify_stamina", default: 0
    t.integer "modify_strength", default: 0
    t.integer "modify_agility", default: 0
    t.integer "modify_health", default: 0
    t.integer "modify_reasoning", default: 0
    t.integer "modify_memory", default: 0
    t.integer "modify_intuition", default: 0
    t.integer "modify_beauty", default: 0
    t.json "special_effects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "character_id"
    t.bigint "resource_id"
    t.string "resource_type"
    t.string "title"
    t.text "description"
    t.float "weight_limit"
    t.integer "item_limit"
    t.json "special_effects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_inventories_on_character_id"
  end

  create_table "inventories_items", force: :cascade do |t|
    t.integer "inventory_id", null: false
    t.integer "item_id", null: false
    t.boolean "equipped", default: false
    t.integer "condition", default: 100
    t.json "modifications"
    t.decimal "price"
    t.string "price_unit", default: "gp"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_inventory_items_on_inventory_id"
    t.index ["item_id"], name: "index_inventory_items_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "hardness"
    t.integer "durability"
    t.float "weight"
    t.string "size"
    t.integer "modify_ac", default: 0
    t.integer "modify_hp", default: 0
    t.integer "modify_age", default: 0
    t.integer "modify_stamina", default: 0
    t.integer "modify_strength", default: 0
    t.integer "modify_agility", default: 0
    t.integer "modify_health", default: 0
    t.integer "modify_reasoning", default: 0
    t.integer "modify_memory", default: 0
    t.integer "modify_intuition", default: 0
    t.integer "modify_beauty", default: 0
    t.boolean "equippable", default: false
    t.boolean "consummable", default: false
    t.boolean "weapon", default: false
    t.boolean "armor", default: false
    t.json "special_effects"
    t.json "requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "preferred_name"
    t.string "pronouns"
    t.string "username", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.boolean "core"
    t.string "primary_stat"
    t.string "secondary_stat"
    t.string "tertiary_stat"
    t.json "requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.json "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "level", default: 1, null: false
    t.json "effects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "virtues", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "magnitude"
    t.integer "modify_ac", default: 0
    t.integer "modify_hp", default: 0
    t.integer "modify_age", default: 0
    t.integer "modify_stamina", default: 0
    t.integer "modify_strength", default: 0
    t.integer "modify_agility", default: 0
    t.integer "modify_health", default: 0
    t.integer "modify_reasoning", default: 0
    t.integer "modify_memory", default: 0
    t.integer "modify_intuition", default: 0
    t.integer "modify_beauty", default: 0
    t.json "special_effects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns_players", "campaigns"
  add_foreign_key "campaigns_players", "players"
  add_foreign_key "characters", "campaigns"
  add_foreign_key "characters", "players"
  add_foreign_key "characters_feats", "characters"
  add_foreign_key "characters_feats", "feats"
  add_foreign_key "characters_flaws", "characters"
  add_foreign_key "characters_flaws", "flaws"
  add_foreign_key "characters_skills", "characters"
  add_foreign_key "characters_skills", "skills"
  add_foreign_key "characters_specializations", "characters"
  add_foreign_key "characters_specializations", "specializations"
  add_foreign_key "characters_spells", "characters"
  add_foreign_key "characters_spells", "spells"
  add_foreign_key "characters_virtues", "characters"
  add_foreign_key "characters_virtues", "virtues"
  add_foreign_key "inventories", "characters"
  add_foreign_key "inventories_items", "inventories"
  add_foreign_key "inventories_items", "items"
end
