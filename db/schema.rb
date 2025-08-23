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

ActiveRecord::Schema[7.2].define(version: 2025_08_22_143436) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reasons_on_user_id"
  end

  create_table "reimbursement_closures", force: :cascade do |t|
    t.string "year"
    t.string "month"
    t.string "period"
    t.boolean "payment"
    t.date "payment_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
    t.string "print_reimbursement"
    t.string "summary_reimbursement"
    t.string "highway_movement_reimbursement"
    t.string "receipt_one_reimbursement"
    t.string "receipt_two_reimbursement"
    t.string "receipt_three_reimbursement"
    t.string "receipt_four_reimbursement"
    t.string "receipt_five_reimbursement"
    t.string "receipt_six_reimbursement"
    t.index ["user_id"], name: "index_reimbursement_closures_on_user_id"
  end

  create_table "reimbursements", force: :cascade do |t|
    t.integer "name"
    t.date "departure_date"
    t.date "return_date"
    t.date "request_date"
    t.date "reimbursement_date"
    t.decimal "parking_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "food_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "room_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "ticket_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "generic_cost", precision: 8, scale: 2, default: "0.0"
    t.decimal "total_amount", precision: 8, scale: 2, default: "0.0"
    t.integer "user_id"
    t.integer "reason_id"
    t.integer "road_id"
    t.integer "place_id"
    t.integer "structure_id"
    t.integer "transport_id"
    t.integer "vehicle_id"
    t.string "user_fr"
    t.string "reason_fr"
    t.string "road_fr"
    t.string "place_fr"
    t.string "structure_fr"
    t.string "transport_fr"
    t.string "vehicle_fr"
    t.decimal "highway_cost_fr", precision: 8, scale: 2, default: "0.0"
    t.decimal "road_lenght_fr", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roads", force: :cascade do |t|
    t.string "name"
    t.decimal "road_lenght", precision: 8, scale: 2
    t.decimal "highway_cost", precision: 8, scale: 2
    t.integer "position"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roads_on_user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_structures_on_user_id"
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "region"
    t.string "province"
    t.string "institute"
    t.string "office"
    t.string "category"
    t.string "validator"
    t.string "validator_presentation"
    t.string "confirmator"
    t.string "confirmator_presentation"
    t.boolean "admin"
    t.boolean "manager"
    t.boolean "payroll"
    t.boolean "regular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "signature"
    t.string "validator_signature"
    t.string "confirmator_signature"
    t.string "institute_logo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "producer"
    t.string "licence_plate"
    t.decimal "cost_per_km", precision: 8, scale: 2
    t.integer "position"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "places", "users"
  add_foreign_key "reasons", "users"
  add_foreign_key "reimbursement_closures", "users"
  add_foreign_key "roads", "users"
  add_foreign_key "structures", "users"
  add_foreign_key "vehicles", "users"
end
