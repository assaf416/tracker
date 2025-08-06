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

ActiveRecord::Schema[8.0].define(version: 2025_08_06_120217) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_db_files", force: :cascade do |t|
    t.string "ref", null: false
    t.binary "data", limit: 700000, null: false
    t.datetime "created_at", null: false
    t.index ["ref"], name: "index_active_storage_db_files_on_ref", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "driver_id"
    t.integer "ride_id"
    t.integer "fleet_id"
    t.integer "device_id"
    t.integer "package_id"
    t.integer "passenger_id"
    t.string "level"
    t.string "kind"
    t.text "message"
    t.text "settings"
    t.string "location"
    t.string "speed"
    t.string "heading"
    t.string "status"
    t.string "lat"
    t.string "longt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_activities_on_device_id"
    t.index ["driver_id"], name: "index_activities_on_driver_id"
    t.index ["fleet_id"], name: "index_activities_on_fleet_id"
    t.index ["kind"], name: "index_activities_on_kind"
    t.index ["level"], name: "index_activities_on_level"
    t.index ["package_id"], name: "index_activities_on_package_id"
    t.index ["passenger_id"], name: "index_activities_on_passenger_id"
    t.index ["ride_id"], name: "index_activities_on_ride_id"
    t.index ["status"], name: "index_activities_on_status"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "ride_id"
    t.integer "fleet_id"
    t.integer "device_id"
    t.integer "passenger_id"
    t.string "name"
    t.string "kind"
    t.text "content_base_64"
    t.integer "driver_id"
    t.integer "package_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_attachments_on_device_id"
    t.index ["driver_id"], name: "index_attachments_on_driver_id"
    t.index ["fleet_id"], name: "index_attachments_on_fleet_id"
    t.index ["kind"], name: "index_attachments_on_kind"
    t.index ["package_id"], name: "index_attachments_on_package_id"
    t.index ["passenger_id"], name: "index_attachments_on_passenger_id"
    t.index ["ride_id"], name: "index_attachments_on_ride_id"
    t.index ["ticket_id"], name: "index_attachments_on_ticket_id"
  end

  create_table "device_kinds", force: :cascade do |t|
    t.integer "device_id"
    t.string "kind_id"
    t.string "name"
    t.string "image_url"
    t.string "price"
    t.text "descriptio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_id"], name: "index_device_kinds_on_kind_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "kind"
    t.integer "user_id"
    t.integer "fleet_id"
    t.integer "device_kind_id"
    t.string "name"
    t.text "settings"
    t.string "type"
    t.string "model"
    t.integer "driver_id"
    t.string "last_location"
    t.datetime "last_location_at"
    t.text "recent_message"
    t.text "system_message"
    t.integer "error_id"
    t.string "avatar"
    t.string "ssid"
    t.string "speed"
    t.string "heading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar"], name: "index_devices_on_avatar"
    t.index ["device_kind_id"], name: "index_devices_on_device_kind_id"
    t.index ["driver_id"], name: "index_devices_on_driver_id"
    t.index ["error_id"], name: "index_devices_on_error_id"
    t.index ["fleet_id"], name: "index_devices_on_fleet_id"
    t.index ["kind"], name: "index_devices_on_kind"
    t.index ["ssid"], name: "index_devices_on_ssid"
    t.index ["type"], name: "index_devices_on_type"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "status"
    t.integer "device_id"
    t.integer "fleet_id"
    t.datetime "starts_at"
    t.text "last_message"
    t.string "last_location"
    t.datetime "locationed_at"
    t.string "speed"
    t.string "heading"
    t.string "lat"
    t.string "longt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_drivers_on_device_id"
    t.index ["fleet_id"], name: "index_drivers_on_fleet_id"
    t.index ["status"], name: "index_drivers_on_status"
  end

  create_table "fleets", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.integer "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fleets_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "kind"
    t.string "icon_url"
    t.string "name"
    t.string "lat"
    t.string "longt"
    t.integer "fleet_id"
    t.string "radius_in_meters"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_locations_on_category"
    t.index ["fleet_id"], name: "index_locations_on_fleet_id"
    t.index ["kind"], name: "index_locations_on_kind"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "driver_id"
    t.text "message"
    t.integer "to_driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_messages_on_driver_id"
    t.index ["to_driver_id"], name: "index_messages_on_to_driver_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "ride_id"
    t.integer "passenger_id"
    t.text "description"
    t.text "qr_code"
    t.datetime "picked_at"
    t.datetime "dropped_at"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_packages_on_driver_id"
    t.index ["passenger_id"], name: "index_packages_on_passenger_id"
    t.index ["ride_id"], name: "index_packages_on_ride_id"
    t.index ["uid"], name: "index_packages_on_uid"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer "ride_id"
    t.string "name"
    t.string "image_url"
    t.integer "rating"
    t.integer "driver_id"
    t.integer "fleet_id"
    t.integer "device_id"
    t.integer "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_passengers_on_device_id"
    t.index ["driver_id"], name: "index_passengers_on_driver_id"
    t.index ["fleet_id"], name: "index_passengers_on_fleet_id"
    t.index ["ride_id"], name: "index_passengers_on_ride_id"
    t.index ["status"], name: "index_passengers_on_status"
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "customer_id"
    t.integer "fleet_id"
    t.string "from_location"
    t.string "from_address"
    t.string "from_lat"
    t.string "from_longt"
    t.string "to_address"
    t.string "to_location"
    t.string "to_lat"
    t.string "to_longt"
    t.float "price"
    t.float "tax"
    t.datetime "starts_at"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "accpeted_at"
    t.integer "accpeted_by_driver_id"
    t.datetime "arrived_to_customer_at"
    t.datetime "dropped_at"
    t.string "drop_location"
    t.string "pickup_location"
    t.string "status"
    t.text "error_message"
    t.text "directions"
    t.text "route_points"
    t.string "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accpeted_by_driver_id"], name: "index_rides_on_accpeted_by_driver_id"
    t.index ["customer_id"], name: "index_rides_on_customer_id"
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["fleet_id"], name: "index_rides_on_fleet_id"
    t.index ["status"], name: "index_rides_on_status"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "driver_id"
    t.string "kind"
    t.datetime "opened_at"
    t.datetime "closed_at"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_tickets_on_driver_id"
    t.index ["kind"], name: "index_tickets_on_kind"
    t.index ["status"], name: "index_tickets_on_status"
  end

  create_table "translations", force: :cascade do |t|
    t.string "hebrew"
    t.string "english"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hebrew"], name: "index_translations_on_hebrew"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "language"
    t.string "phone_no"
    t.string "image_url"
    t.string "schema"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_no"], name: "index_users_on_phone_no"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
