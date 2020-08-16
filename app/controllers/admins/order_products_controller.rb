class Admins::OrderProductsController < ApplicationController
	def update
		@order_product = OrderProduct.find(params[:id])
	  	@order_product.update(order_params)
	  	
	  	if @order_product.production_status == "製作中"
	  		@order_product.order.update(order_status: 2)
	  	elsif @order_product.order.order_products.all?{|op| op.production_status == "製作完了"}
	  		@order_product.order.update(order_status: 3)
	  	end
	   	redirect_to admins_order_path(@order_product.order.id)
	end

	private
	def order_params
		params.require(:order_product).permit(:production_status)
	end
end
