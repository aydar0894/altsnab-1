class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.string :name, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
