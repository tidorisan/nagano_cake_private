class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :postage
      t.integer :request_amount
      t.boolean :payment_method
      t.integer :order_status
      t.string :post_address
      t.string :address
      t.string :full_name

      t.timestamps
    end
  end
end
