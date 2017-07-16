json.extract! subitem, :id, :name, :description, :price, :subitem_category_id, :created_at, :updated_at
json.url subitem_url(subitem, format: :json)
