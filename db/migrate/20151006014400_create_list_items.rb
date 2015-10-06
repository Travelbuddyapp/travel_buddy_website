class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :content
      t.boolean :completed, default: false
      t.belongs_to :checklist

      t.timestamps null: false
    end
  end
end
