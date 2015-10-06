class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :title
      t.date :due_date
      t.integer :trip_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
