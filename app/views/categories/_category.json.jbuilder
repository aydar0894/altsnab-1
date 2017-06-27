json.extract! category, :id, :name, :category_id, :is_leaf, :created_at, :updated_at
json.url category_url(category, format: :json)
