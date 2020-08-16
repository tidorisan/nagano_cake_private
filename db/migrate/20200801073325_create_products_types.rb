class CreateProductsTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :products_types do |t|
      t.string :type_name
      t.boolean :type_status

      t.timestamps
    end
  end
end
