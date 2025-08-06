json.extract! device, :id, :kind, :user_id, :name, :settings, :type, :model, :driver_id, :last_location, :last_location_at, :recent_message, :system_message, :error_id, :avatar, :ssid, :created_at, :updated_at
json.url device_url(device, format: :json)
