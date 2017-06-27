class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :parent_category, index: true, foreign_key: { to_table: :categories }, null: true
      t.boolean :is_leaf, default: true

      t.timestamps
    end
  end
end
