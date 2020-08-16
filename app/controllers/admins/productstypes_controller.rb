class Admins::ProductstypesController < ApplicationController
  def index
  	@type_new = ProductsType.new
  	@types = ProductsType.all
  end

  def create
  	@type_new = ProductsType.new(type_params)
  	@type_new.save
	  redirect_to admins_productstypes_path  #成功の場合
  end

  def edit
  	@type = ProductsType.find(params[:id])
  end

  def update
  	@type = ProductsType.find(params[:id])
  	if @type.update(type_params)
			redirect_to admins_productstypes_path
		else
			render "edit"
		end
  end

  private
	def type_params
		params.require(:products_type).permit(:type_name, :type_status)
	end
end
