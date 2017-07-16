class CreateSubitemFields < ActiveRecord::Migration[5.0]
  def change
    create_table :subitem_fields do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
