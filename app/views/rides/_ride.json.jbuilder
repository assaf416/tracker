json.extract! ride, :id, :driver_id, :customer_id, :from_location, :from_address, :accpeted_at, :arrived_to_customer_at, :dropped_at, :drop_location, :pickup_location, :status, :error_message, :created_at, :updated_at
json.url ride_url(ride, format: :json)
