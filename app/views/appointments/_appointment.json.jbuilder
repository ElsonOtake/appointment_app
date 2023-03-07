json.extract! appointment, :id, :booking, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
