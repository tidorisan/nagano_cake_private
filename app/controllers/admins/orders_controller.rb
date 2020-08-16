class Admins::OrdersController < ApplicationController
  def top
    @order = Order.all
  end

  def index
  	@order = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
    if @order.order_status == "入金確認"
      @order.order_products.each do |op|
        op.update(production_status: 1)
      end
    end
   	redirect_to admins_order_path(@order.id)
  end

  private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
