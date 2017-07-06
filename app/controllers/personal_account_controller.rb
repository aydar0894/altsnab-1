class PersonalAccountController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@paymnt_data = PaymentInformation.find(@user.payment_information_id)
		@juristic_data = JuristicDocument.find(@user.juristic_document_id)		
		@shipment_info = ShipmentInformation.where(user_id: @user.id)	
	end
end
