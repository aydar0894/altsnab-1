class CreateSubitemItemCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subitem_item_categories do |t|
      t.references :subitem, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
