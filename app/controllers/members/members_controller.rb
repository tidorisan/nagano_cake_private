class Members::MembersController < ApplicationController
  def show
  		@member = Member.find(current_member.id)
  end

  def edit
  		@member = Member.find(params[:id])
  end

  # 追加しました[member/members/:id/edit_update]＿りのじ
  def update
  		@member = Member.find(params[:id])
  		if @member.update(member_params)
  			redirect_to members_member_path(@member), notice: "successfully"
  		else
  			render "members/members/edit"
  		end
  end

  def leave
    @member = Member.find(current_member.id)
  end

  def destroy_update
    member = Member.find(current_member.id)
    member.update(member_status: true)
    reset_session
    redirect_to root_path
  end

  # 追加しました[member/members/:id/edit_update]＿りのじ ストロングパラメーター
  private
  def member_params
  		params.require(:member).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :email, :post_number, :telephone_number, :address)
  end

end
