class AddShipmentInformationToUser < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :shipment_information, foreign_key: true
  end
end
