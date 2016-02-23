class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.string :mobile
      t.string :email
      t.text :notes

      t.timestamps null: false
    end
  end
end
