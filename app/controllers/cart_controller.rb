class CartController < ApplicationController
  # respond_to :json, :js, only: [:increment_cart_item_count]

  # GET /cart
  def index
    @cart_items = current_cart.get_items.all
    @price_total = @cart_items.reduce(0) {
      |sum, x| sum += x.item.price * x.count + x.order_item_subitems.reduce(0) {
        |sub_sum, sub_x| sub_sum += sub_x.subitem.price
      }
    }
  end

  # POST /cart/add_item/:item_id
  def add_item
    current_cart.add_item(params[:item_id], params[:count])
  end

  # POST /cart/update_subitem/:order_item_id
  def update_subitems
    # abort params.inspect
    # abort params.require(:order_item).permit(order_item_subitems_attributes: [:id, :subitem_id, :_destroy]).inspect
    # current_cart.add_item(params[:item_id], params[:count])
    return if !params[:order_item]

    subitems = params.require(:order_item).permit(order_item_subitems_attributes: [:id, :subitem_id, :_destroy])
    current_cart.update_subitems(params[:order_item_id], subitems)
  end

  # POST /cart/add_item_with_subitems/:item_id
  def add_item_with_subitems
    current_cart.add_item_with_subitems(
      item_id: params[:item_id],
      count: params[:count]
    )
  end

  # DELETE /cart/delete_item/:item_id
  def delete_item
    current_cart.delete_item(params[:item_id])
    redirect_to cart_path
  end

  # DELETE /cart/delete_subitem/:order_subitem_id
  def delete_subitem
    current_cart.delete_subitem(params[:order_subitem_id])
    redirect_to cart_path
  end

  # PUT /cart/increment_item_count/:item_id
  def increment_item_count
    return head 200 if current_cart.increment_item_count(params[:item_id])
    return head 500
  end

  # PUT /cart/decrement_item_count/:item_id
  def decrement_item_count
    return head 200 if current_cart.decrement_item_count(params[:item_id])
    return head 500
  end

  # PUT /cart/set_item_count/:item_id/:count
  def set_item_count
    return head 200 if current_cart.set_item_count(params[:item_id], params[:count])
    return head 500
  end

end
