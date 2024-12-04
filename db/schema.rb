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

ActiveRecord::Schema.define(version: 2024_12_04_174000) do

  create_table "tip_calculations", force: :cascade do |t|
    t.decimal "bill_amount", precision: 10, scale: 2
    t.integer "tip_percentage"
    t.decimal "tip_amount", precision: 10, scale: 2
    t.decimal "total_bill", precision: 10, scale: 2
    t.integer "number_of_people"
    t.decimal "per_person_amount", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
