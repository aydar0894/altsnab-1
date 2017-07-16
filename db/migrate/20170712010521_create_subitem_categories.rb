class CreateSubitemCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subitem_categories do |t|
      t.text :name

      t.timestamps
    end
  end
end
