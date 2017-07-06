class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def add_item_to_cart(item)
    (session[:cart] ||= []) << {item_id: item.id, count: 1, additional_equipment: []}
    # abort(session[:cart].inspect)
  end

  def get_cart_items
    (session[:cart] ||= [])
  end
end
