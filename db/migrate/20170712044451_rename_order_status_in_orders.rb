class RenameOrderStatusInOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :order_status, :status
  end
end
