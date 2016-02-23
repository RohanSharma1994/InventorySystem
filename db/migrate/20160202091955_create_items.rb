class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.integer :quantity
      t.integer :item_number_one
      t.integer :item_number_two
      t.float :price
      t.float :retail_price
      t.text :notes

      t.timestamps null: false
    end
  end
end
