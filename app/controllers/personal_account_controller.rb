class PersonalAccountController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@paymnt_data = PaymentInformation.find(@user.payment_information_id)
		@juristic_data = JuristicDocument.find(@user.juristic_document_id)		
	end
end
