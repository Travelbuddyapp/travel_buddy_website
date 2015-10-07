class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :title
      t.date :due_date
      t.belongs_to :trip
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
