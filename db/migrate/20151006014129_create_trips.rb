class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.text :ice_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
