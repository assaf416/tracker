json.extract! user, :id, :name, :role, :email, :phone_no, :created_at, :updated_at
json.url user_url(user, format: :json)
