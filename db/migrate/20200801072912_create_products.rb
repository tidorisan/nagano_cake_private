class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :explanation
      t.string :image_id
      t.string :sales_status
      t.string :products_type_id
      t.integer :unit_price

      t.timestamps
    end
  end
end
