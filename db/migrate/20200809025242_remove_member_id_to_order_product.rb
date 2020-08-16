class RemoveMemberIdToOrderProduct < ActiveRecord::Migration[5.2]
  def change
  	remove_column :order_products, :member_id, :integer
  end
end
