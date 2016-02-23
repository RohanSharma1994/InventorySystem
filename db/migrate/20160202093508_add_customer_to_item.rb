class AddCustomerToItem < ActiveRecord::Migration
  def change
    add_reference :items, :customer, index: true, foreign_key: true
  end
end
