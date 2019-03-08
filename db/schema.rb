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

ActiveRecord::Schema.define(version: 2019_01_08_100302) do

  create_table "kibans", force: :cascade do |t|
    t.integer "経過日"
    t.string "基板名"
    t.date "最終注文日"
    t.string "メーカー"
    t.boolean "終了", default: false
    t.string "備考"
    t.boolean "期限間近", default: false
  end

  create_table "maker_deadlines", force: :cascade do |t|
    t.string "メーカー"
    t.integer "期限", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
