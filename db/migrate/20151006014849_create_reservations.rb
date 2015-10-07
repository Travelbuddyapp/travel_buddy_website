class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :type
      t.string :business_name
      t.string :confirmation_number
      t.date :check_in_date
      t.date :check_out_date
      t.text :note
      t.belongs_to :trip

      t.timestamps null: false
    end
  end
end
