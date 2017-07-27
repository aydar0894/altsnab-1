class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    if get_cart_id && !current_user
      order = Order.find(get_cart_id)
      return order if order&.cart?
    end

    if current_user
      order = Order.find_by(user_id: current_user.id, status: 0)
      if order&.cart?
        set_cart_id(order&.id)
        return order
      end

      order = Order.create(user_id: current_user.id, status: 0)
      set_cart_id(order.id)
      return order
    else
      order = Order.create(user_id: nil, status: 0)
      set_cart_id(order.id)
      return order
    end
  end

  def set_cart_id(cart_id)
    cookies.permanent.signed[:cart_id] = cart_id
  end

  def get_cart_id
    cookies.signed[:cart_id]
  end

  protected

  def response_200!
    render status: 200, json: {status: 'ok'}.to_json
  end

  def is_admin!
  	if (current_user and !current_user.is_admin?)
  		redirect_to root_path
  	elsif !current_user
  		redirect_to new_user_session_path
  	end
  end
end
