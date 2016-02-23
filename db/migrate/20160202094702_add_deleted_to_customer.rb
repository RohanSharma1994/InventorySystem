class AddDeletedToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :deleted, :boolean
  end
end
