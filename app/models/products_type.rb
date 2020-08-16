class ProductsType < ApplicationRecord
	has_many :products, dependent: :destroy
end
