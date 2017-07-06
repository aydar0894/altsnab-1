class OrdersController < ApplicationController
  # respond_to :json, :js, only: [:increment_cart_item_count]

  # POST /orders/add_to_cart/:item_id
  def add_to_cart
    item = Item.find(params[:item_id])
    add_item_to_cart(item)
  end

  # DELETE /orders/delete_from_cart/:item_id
  def delete_from_cart
    delete_item_from_cart(params[:item_id])
    redirect_to cart_path
  end

  # PUT /orders/increment_cart_item_count/:item_id
  def increment_cart_item_count
    increment_item_count_in_cart(params[:item_id])
  end

  # PUT /orders/decrement_cart_item_count/:item_id
  def decrement_cart_item_count
    decrement_item_count_in_cart(params[:item_id])
  end

  # GET /cart
  def cart
    @cart_items_info = (get_cart_items || [])
    @cart_items_ids = @cart_items_info.collect {|ci| ci['item_id']}
    @cart_items_ids = @cart_items_ids.select do |ci|
      !ci.nil?
    end
    @cart_items = Item.find(@cart_items_ids)
  end

end
