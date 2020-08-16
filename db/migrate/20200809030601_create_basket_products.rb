class CreateBasketProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_products do |t|
      t.integer :member_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
