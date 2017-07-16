class CreateSubitemCategoryFields < ActiveRecord::Migration[5.0]
  def change
    create_table :subitem_category_fields do |t|
      t.references :subitem_category, foreign_key: true
      t.references :subitem_field, foreign_key: true

      t.timestamps
    end
  end
end
