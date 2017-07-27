class CreateSubitems < ActiveRecord::Migration[5.0]
  def change
    create_table :subitems do |t|
      t.text :name
      t.text :description
      t.float :price
      t.references :subitem_category, foreign_key: true

      t.timestamps
    end
  end
end
