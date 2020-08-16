class Admins::MembersController < ApplicationController
  def index
  		@members = Member.page(params[:page])
  end

  def show
  		@member = Member.find(params[:id])
  end

  def edit
  		@member = Member.find(params[:id])
  end

  def update
  		@member = Member.find(params[:id])
  		@member.update(member_params)
  		redirect_to admins_member_path(@member)
  end

  private
  def member_params
  		params.require(:member).permit(:last_name, :first_name, :last_kana_name,
  		 :first_kana_name, :post_number, :address , :telephone_number, :email ,
  		  :member_status)
  end

end
