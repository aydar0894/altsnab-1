class CategoryFieldValue < ApplicationRecord
  belongs_to :item, dependent: :delete
  belongs_to :category_field, dependent: :delete

  def field
      self.category_field.field
  end
end
