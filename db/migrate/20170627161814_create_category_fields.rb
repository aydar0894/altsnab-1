class CreateCategoryFields < ActiveRecord::Migration[5.0]
  def change
    create_table :category_fields do |t|
      t.references :category, foreign_key: true
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end
