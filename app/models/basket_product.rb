class BasketProduct < ApplicationRecord
	belongs_to :member, optional: true
	belongs_to :product, optional: true

	def sub_total
		product.tax_price * quantity
	end
end
