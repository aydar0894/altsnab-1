class CreateJuristicDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :juristic_documents do |t|
      t.text :company_full_name
      t.text :company_short_name
      t.text :ceo_name
      t.text :legal_address
      t.text :postal_address
      t.text :inn
      t.text :kpp
      t.text :ogrn
      t.text :okpo
      t.text :okato

      t.timestamps
    end
  end
end
