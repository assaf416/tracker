json.extract! message, :id, :driver_id, :message, :to_driver_id, :created_at, :updated_at
json.url message_url(message, format: :json)
