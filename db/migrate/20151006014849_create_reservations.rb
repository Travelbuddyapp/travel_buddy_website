class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :reservation_type
      t.string :business_name
      t.string :confirmation_number
      t.date :check_in_date
      t.date :check_out_date
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
