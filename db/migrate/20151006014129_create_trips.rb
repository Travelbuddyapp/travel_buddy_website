class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.text :ice_id
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
