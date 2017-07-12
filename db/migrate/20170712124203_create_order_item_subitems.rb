class CreateOrderItemSubitems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_item_subitems do |t|
      t.references :subitem, foreign_key: true
      t.references :order_item, foreign_key: true
      t.float :price
      t.integer :count

      t.timestamps
    end
  end
end
