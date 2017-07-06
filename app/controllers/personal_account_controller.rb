class PersonalAccountController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@paymnt_data = PaymentInformation.find(@user.payment_information_id)
		@juristic_data = JuristicDocument.find(@user.juristic_document_id)
		@shipment_info = ShipmentInformation.where(user_id: @user.id)
	end
end
