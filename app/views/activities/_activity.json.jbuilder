json.extract! activity, :id, :user_id, :driver_id, :ride_id, :device_id, :level, :message, :settings, :location, :speed, :heading, :status, :created_at, :updated_at
json.url activity_url(activity, format: :json)
