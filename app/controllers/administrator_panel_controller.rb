class AdministratorPanelController < ApplicationController
	before_action :is_admin!

	def index

	end

	def all_users
		@users = User.where(role: 0)
	end

	def show_user_info
		@user = User.find(params[:user_id])
		@juristic_data = JuristicDocument.find(@user.juristic_document_id)
		@shipment_info = ShipmentInformation.where(user_id: @user.id)
	end

end
