class Members::OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order_new = Order.new
    @members = Member.all
    @dest = Destination.new
  end

  def create
    @order = Order.new(order_set)
    if @order.save!
      current_member.basket_products.each do |basket|
        @price = basket.product.unit_price * basket.quantity
        @order_products = OrderProduct.new(
          product_id: basket.product.id,
          quantity_purchased: basket.quantity,
          price_at_purchase: @price,
          order_id: @order.id)
        
        @order_products.save!
      end
      current_member.basket_products.destroy_all
    end
    redirect_to members_success_path
  end

  def confirm
    @price_array = []
    @total_array = []
    @order = Order.new
    if params[:payment_method] == 'true'
      @order.payment_method = true
    else
      @order.payment_method = false
    end
    @user = Member.find(current_member.id)

    if params[:address_option] == "0"
      @post = @user.post_number
      @address = @user.address
      @name = @user.last_name + @user.first_name
    elsif params[:address_option] == "1"
      @destination = Destination.find(dest_set[:id])
      @post = @destination.post_address
      @address = @destination.address
      @name = @destination.full_name
    elsif params[:address_option] == "2"
      @new_destination = Destination.new(dest_params)
      @post = @new_destination.post_address
      @address = @new_destination.address
      @name = @new_destination.full_name

      @destination = Destination.new(
        member_id: current_member.id,
        address: @post,
        post_address: @address,
        full_name: @name)
      @destination.save!
    end
  end

  def success
  end

  private
  def order_set
    params.require(:order).permit(:member_id, :request_amount, :payment_method, :address, :post_address, :full_name)
  end

  def dest_set
    params.permit(:id)
  end

  def dest_params
    params.permit(:member_id, :address, :post_address, :full_name)
  end
end
