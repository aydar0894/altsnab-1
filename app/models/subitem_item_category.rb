class SubitemItemCategory < ApplicationRecord
  belongs_to :subitem
  belongs_to :category
end
