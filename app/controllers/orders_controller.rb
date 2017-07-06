class OrdersController < ApplicationController

  # POST /orders/add_to_cart/:item_id
  def add_to_cart
    item = Item.find(params[:item_id])
    add_item_to_cart(item)
  end

  # GET /cart
  def cart
    @cart_items_info = (get_cart_items || [])
    @cart_items_ids = @cart_items_info.collect{|ci| ci['item_id']}
    @cart_items_ids = @cart_items_ids.select do |ci|
      !ci.nil?
    end
    @cart_items = Item.find(@cart_items_ids)
  end

end
