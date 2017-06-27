class CreateCategoryFieldValues < ActiveRecord::Migration[5.0]
  def change
    create_table :category_field_values do |t|
      t.references :item, foreign_key: true
      t.references :category_field, foreign_key: true
      t.string :value, null: true

      t.timestamps
    end
  end
end
