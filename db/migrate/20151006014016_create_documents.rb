class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.date :expiration_date
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
