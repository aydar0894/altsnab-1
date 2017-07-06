class CreateShipmentInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :shipment_informations do |t|
      t.text :country
      t.text :city
      t.text :address
      t.text :zip_code
      t.boolean :is_main

      t.timestamps
    end
  end
end
