class Admins::ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page])
    # ページング機能を実装させました。1page10件表示します。
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  	   flash[:notice] = "Product was successfully created"
  	   redirect_to admins_product_path(@product.id)
  	else
  	   render :new
  	end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  	   flash[:notice] = "Product was successfully updated"
  	   redirect_to admins_product_path(@product.id)
  	else
  	   render :edit
  	end
  end

  private
  def product_params
  	params.require(:product).permit(:name, :image, :explanation, :sales_status, :products_type_id, :unit_price )
 end
end
