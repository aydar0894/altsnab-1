class PersonalAccountController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@paymnt_data = PaymentInformation.find(@user.payment_information_id)
		@juristic_data = JuristicDocument.find(@user.juristic_document_id)
		@shipment_info = ShipmentInformation.where(user_id: @user.id)
	end

	def show_orders_history
		@user = current_user
		@orders = Order.where(status: 'cart')
	end

	def show_order
		@order = Order.find(params[:order_id])
		@order_items = OrderItem.where(order_id: @order.id)		
	end

end
