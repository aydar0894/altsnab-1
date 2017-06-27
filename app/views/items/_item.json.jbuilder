json.extract! item, :id, :name, :description, :category_id, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
