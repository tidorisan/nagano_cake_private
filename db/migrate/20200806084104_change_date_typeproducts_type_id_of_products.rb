class ChangeDateTypeproductsTypeIdOfProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :products_type_id, :integer
  end
end
