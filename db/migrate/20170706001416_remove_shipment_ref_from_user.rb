class RemoveShipmentRefFromUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :shipment_information_id
  end
end
