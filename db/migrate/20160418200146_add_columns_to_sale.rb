class AddColumnsToSale < ActiveRecord::Migration
  def change
    add_column :sales, :transaction_type, :string
    add_column :sales, :deposit_amount, :float
    add_column :sales, :reference_number, :string
    add_column :sales, :sale_status, :string
  end
end
