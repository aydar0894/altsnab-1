class AddJuristicDocumentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :juristic_document, foreign_key: true
  end
end
