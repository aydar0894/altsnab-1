class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.references :category, foreign_key: true, null: true
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
