class OrdersController < ApplicationController
  # respond_to :json, :js, only: [:increment_cart_item_count]

  before_action :is_admin!, only: [:show_orders,:show]


  def reorder
    @order = Order.find(params[:order_id])
    current_cart.clear
    
    @order.order_items.each do |order_item|
      subitems_hash = {}
      order_item.order_item_subitems.each_with_index do |subitem, index| 
        subitems_hash[index] = {id: subitem.subitem_id}
      end
      current_cart.add_item_with_subitems(order_item.item_id, order_item.count, subitems_hash)
    end
    redirect_to cart_path
  end

  def show_orders
    @orders = Order.all
  end

  def show
    @order = params[:order]
  end

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
    @items_price_total = 0
    @cart_items = Item.find(@cart_items_ids)
    @cart_items.each_with_index do |cart_item, index|
      cart_item_info = @cart_items_info[index]
      price_total = cart_item.price * cart_item_info['count']
      @items_price_total += price_total
    end
  end

end
