class Category < ApplicationRecord
  belongs_to :parent_category, :foreign_key => 'parent_category_id', class_name: "Category"
  has_many :category_fields
  has_many :items

end
