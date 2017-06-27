class CategoryFieldValue < ApplicationRecord
  belongs_to :item
  belongs_to :category_field
end
