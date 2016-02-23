class AddSaleToItem < ActiveRecord::Migration
  def change
    add_reference :items, :sale, index: true, foreign_key: true
  end
end
