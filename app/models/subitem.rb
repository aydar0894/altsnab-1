class Subitem < ApplicationRecord
  belongs_to :subitem_category
  has_many :subitem_item_categories

  accepts_nested_attributes_for :subitem_item_categories, reject_if: :all_blank, allow_destroy: true


end
