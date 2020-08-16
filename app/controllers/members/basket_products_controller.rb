class Members::BasketProductsController < ApplicationController
  def index
  	@basket_products = current_member.basket_products
    @total_price = @basket_products.sum(&:sub_total)
  end

  def create
  	@basket_product = BasketProduct.new(basket_product_params)
  	@basket_product.member_id = current_member.id
  	@basket_product.save
  	  redirect_to members_basket_products_path, success: "商品をカートに追加しました。"
  end

  def update
  	@basket_product = BasketProduct.find(params[:id])
  	if @basket_product.update(basket_product_params)
  	   redirect_to members_basket_products_path, success: "個数を変更しました。"
  	else
  		render :index, danger: "個数の変更に失敗しました。"
  	end
  end

  def destroy
  	@basket_product = BasketProduct.find(params[:id])
  	if @basket_product.destroy
  	     redirect_to members_basket_products_path, success: "商品の削除が完了しました。"
  	else
  		render :index, danger: "商品の削除ができませんでした。"
  	end
  end

  def alldestroy
  	@basket_products = BasketProduct.where(member_id: current_member.id)
    if @basket_products.destroy_all
  	   redirect_to members_basket_products_path, success: "全商品の削除が完了しました。"
  	else
  		render :index, danger: "全商品の削除ができませんでした。"
  	end
  end

  private
  def basket_product_params
    params.require(:basket_product).permit(:member_id, :product_id, :quantity)
  end

end
