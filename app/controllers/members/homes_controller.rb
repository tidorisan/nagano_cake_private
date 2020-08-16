class Members::HomesController < ApplicationController
  def top
  	@types = ProductsType.all
  	@product_1 = Product.find(1)
  	@product_2 = Product.find(2)
  	@product_3 = Product.find(3)
  	@product_4 = Product.find(4)
  end

  def about
  end
end
