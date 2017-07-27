class CreateSubitemCategoryFieldValues < ActiveRecord::Migration[5.0]
  def change
    create_table :subitem_category_field_values do |t|
      t.references :subitem, foreign_key: true
      t.references :subitem_category_field, foreign_key: true, index: {:name => "subitem_category_field"}

      t.timestamps
    end
  end
end
