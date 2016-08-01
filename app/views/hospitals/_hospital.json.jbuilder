json.extract! hospital, :id, :name, :shipment_count, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)