class Product < ApplicationRecord
  #商品の画像 refile メソッド
	attachment :image

	belongs_to :products_type, optional: true
	has_many :order_products
	has_many :basket_products, dependent: :destroy
	validates :name, presence: true
	validates :explanation, presence: true
	validates :products_type_id, presence: true
	validates :unit_price, presence: true

	def tax_price
		(unit_price * 1.1).round
	end
end
