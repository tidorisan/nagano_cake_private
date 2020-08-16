class RemoveProductsIdFromOrderProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_products, :products_id, :integer
  end
end
