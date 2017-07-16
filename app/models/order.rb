class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :delete_all

  enum status: { cart: 0, ordered: 1, payed: 2, completed: 3 }

  def get_items
    self.order_items.order(:id)
  end

  def add_item(item_id, count)
    order_item = self.order_items.create(item_id: item_id, count: 1)
  end

  def delete_item(item_id)
    self.order_items.find_by(item_id: item_id)&.delete
    self.save
  end

  def increment_item_count(item_id)
    order_item = self.order_items.find_by(item_id: item_id)
    order_item&.count += 1
    order_item&.save
  end

  def decrement_item_count(item_id)
    order_item = self.order_items.find_by(item_id: item_id)
    return if order_item&.count <= 1
    order_item&.count -= 1
    order_item&.save
  end

  def set_item_count(item_id, count)
    order_item = self.order_items.find_by(item_id: item_id)
    order_item&.count = count
    order_item&.save
  end

  def delete_all
    self.order_items.destroy_all
    self.save
  end

end
