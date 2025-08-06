json.extract! passenger, :id, :ride_id, :name, :image_url, :rating, :driver_id, :device_id, :status, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
