class AddMemberIdToOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :member_id, :integer
  end
end
