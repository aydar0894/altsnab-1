class SubitemCategoryFieldValue < ApplicationRecord
  belongs_to :subitem
  belongs_to :subitem_category_field
end
