class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.string :name
      t.integer :quantity
      t.float :price_per_item
      t.float :total_price
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
