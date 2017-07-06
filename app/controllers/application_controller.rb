class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def add_item_to_cart(item)
    (session[:cart] ||= []) << {item_id: item.id, count: 1, additional_equipment: []}
  end

  def delete_item_from_cart(item_id)
    session[:cart] = session[:cart].select do |cart_item|
      cart_item['item_id'].to_i != item_id.to_i
    end
  end

  def increment_item_count_in_cart(item_id)
    session[:cart] = session[:cart].each do |cart_item|
      cart_item['count'] = cart_item['count'].to_i + 1 if cart_item['item_id'] == item_id.to_i
    end
  end

  def decrement_item_count_in_cart(item_id)
    session[:cart] = session[:cart].each do |cart_item|
      cart_item['count'] = cart_item['count'].to_i - 1 if cart_item['item_id'] == item_id.to_i && cart_item['count'].to_i > 1
    end
  end

  def get_cart_items
    (session[:cart] ||= [])
  end
end
