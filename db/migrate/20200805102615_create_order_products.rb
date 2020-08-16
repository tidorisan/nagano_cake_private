class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :products_id
      t.integer :production_status
      t.integer :price_at_purchase
      t.integer :quantity_purchased

      t.timestamps
    end
  end
end
