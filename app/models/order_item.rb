class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  has_many :order_item_subitems, dependent: :delete_all

  alias_attribute :order_subitems, :order_item_subitems
  accepts_nested_attributes_for :order_item_subitems, reject_if: :all_blank, allow_destroy: true
  
end
