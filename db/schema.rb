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

ActiveRecord::Schema.define(version: 20160804183947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_objectives", force: :cascade do |t|
    t.string   "parent_type"
    t.integer  "parent_id"
    t.integer  "age"
    t.string   "sex"
    t.datetime "culture_date"
    t.string   "serviceb"
    t.integer  "accession_number"
    t.string   "icu"
    t.string   "nosocomial"
    t.string   "code_number"
    t.integer  "shipment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "base_objectives", ["parent_id"], name: "index_base_objectives_on_parent_id", using: :btree
  add_index "base_objectives", ["parent_type"], name: "index_base_objectives_on_parent_type", using: :btree
  add_index "base_objectives", ["shipment_id"], name: "index_base_objectives_on_shipment_id", using: :btree

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.integer  "shipment_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "objective_a", force: :cascade do |t|
    t.integer  "jmi_number"
    t.string   "organism_species"
    t.datetime "admission_date"
    t.string   "spec_type",         default: "BC"
    t.string   "source_of_bsia"
    t.string   "primary_diagnosis"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name"
  end

  create_table "objective_b", force: :cascade do |t|
    t.integer  "jmi_number"
    t.string   "specimen_typea"
    t.string   "bacteria_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
  end

  create_table "objective_q", force: :cascade do |t|
    t.string   "organism_species"
    t.string   "specimen_typea"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "hospital_id"
    t.boolean  "sent"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "target_isolates"
    t.integer  "isolate_count"
    t.string   "objective_name"
  end

  add_index "shipments", ["hospital_id"], name: "index_shipments_on_hospital_id", using: :btree

end
