class AddUserIdToShipmentInformation < ActiveRecord::Migration[5.0]
  def change
  	add_reference :shipment_informations, :user, foreign_key: true
  end
end
