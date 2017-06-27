class CategoryField < ApplicationRecord
  belongs_to :category
  belongs_to :field
  has_many :category_field_values, dependent: :nullify
end
