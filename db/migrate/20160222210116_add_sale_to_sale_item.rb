class AddSaleToSaleItem < ActiveRecord::Migration
  def change
    add_reference :sale_items, :sale, index: true, foreign_key: true
  end
end
