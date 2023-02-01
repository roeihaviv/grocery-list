class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item
      t.string :related_items
      t.string :status
      t.string :category
      t.string :picture

      t.timestamps
    end
  end
end
