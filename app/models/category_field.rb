class CategoryField < ApplicationRecord
  belongs_to :category
  belongs_to :field
  has_many :category_field_values, dependent: :delete_all

  def get_item_field(item_id)
    self.category_field_values.select { |cfv| cfv.item_id == item_id }.first
  end
end
