class CreatePaymentInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_informations do |t|
      t.text :payment_account
      t.text :bank_name
      t.text :bik
      t.text :bank_correspondent_account

      t.timestamps
    end
  end
end
