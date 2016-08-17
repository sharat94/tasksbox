class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :order_number
      t.integer :total
      t.integer :quantity
      t.integer :price

      t.timestamps null: false
    end
  end
end
