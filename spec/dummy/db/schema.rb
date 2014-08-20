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

ActiveRecord::Schema.define(version: 20140820221219) do

  create_table "apprenticeships", force: true do |t|
    t.integer  "student_id"
    t.string   "philosopher_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apprenticeships", ["philosopher_id"], name: "index_apprenticeships_on_philosopher_id"
  add_index "apprenticeships", ["student_id"], name: "index_apprenticeships_on_student_id"

  create_table "esoteric_tool_sets", force: true do |t|
    t.integer  "feathered_quill_id"
    t.integer  "philosopher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "esoteric_tool_sets", ["feathered_quill_id"], name: "index_esoteric_tool_sets_on_feathered_quill_id"
  add_index "esoteric_tool_sets", ["philosopher_id"], name: "index_esoteric_tool_sets_on_philosopher_id"

  create_table "feathered_quills", force: true do |t|
    t.string   "feather_type"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentions", force: true do |t|
    t.string   "source_title"
    t.string   "author"
    t.string   "published_at"
    t.integer  "paradigm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mentions", ["paradigm_id"], name: "index_mentions_on_paradigm_id"

  create_table "paradigms", force: true do |t|
    t.string   "pattern"
    t.integer  "exemplar_id"
    t.string   "archetype"
    t.string   "prototype"
    t.string   "example"
    t.boolean  "common"
    t.datetime "discovered_at"
    t.integer  "quantity"
    t.datetime "nullified_at"
    t.integer  "era_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paradigms", ["era_id"], name: "index_paradigms_on_era_id"
  add_index "paradigms", ["exemplar_id"], name: "index_paradigms_on_exemplar_id"

  create_table "paradigms_philosophers", id: false, force: true do |t|
    t.integer "paradigm_id"
    t.integer "philosopher_id"
  end

  add_index "paradigms_philosophers", ["paradigm_id"], name: "index_paradigms_philosophers_on_paradigm_id"
  add_index "paradigms_philosophers", ["philosopher_id"], name: "index_paradigms_philosophers_on_philosopher_id"

  create_table "philosophers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "born_on"
    t.string   "country"
    t.string   "field_of_study"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
