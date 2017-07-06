class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :order_status, null: true
      t.datetime :ordered_date
      t.datetime :payed_date
      t.datetime :completed_date

      t.timestamps
    end
  end
end
