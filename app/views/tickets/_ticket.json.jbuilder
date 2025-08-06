json.extract! ticket, :id, :driver_id, :kind, :opened_at, :closed_at, :description, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
