class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.string :name
      t.text :details
      t.string :administration_method
      t.date :date_given
      t.date :expiration_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
