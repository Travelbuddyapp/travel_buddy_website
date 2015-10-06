class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.float :latitude
      t.float :longitude
      t.text :address
      t.belongs_to :user
      t.belongs_to :reservation

      t.timestamps null: false
    end
  end
end
