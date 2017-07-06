json.extract! shipment_information, :id, :country, :city, :address, :zip_code, :is_main, :created_at, :updated_at
json.url shipment_information_url(shipment_information, format: :json)
