class OrderItemSubitem < ApplicationRecord
  belongs_to :subitem
  belongs_to :order_item
end
