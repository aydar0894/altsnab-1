class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  has_many :order_item_subitems, dependent: :delete_all
end
