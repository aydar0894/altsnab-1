class Category < ApplicationRecord
  belongs_to :parent_category, :foreign_key => 'parent_category_id', class_name: "Category", optional: true
  has_many :category_fields, dependent: :delete_all
  has_many :items, dependent: :nullify
  has_many :subitem_item_categories

  accepts_nested_attributes_for :category_fields, reject_if: :all_blank, allow_destroy: true
end
