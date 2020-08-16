# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
       # emailを受け取る処理
      @member = Member.find_by(email: params[:member][:email].downcase)
      # emailで存在しているか調べる
      if @member
          if (@member.valid_password?(params[:member][:password]) && (@member.member_status == true))
            flash[:error] = "退会済みです。"
            redirect_to new_member_session_path
          else
            super
          end
      else
          flash[:error] = "必須項目を入力してください。"
          redirect_to new_member_session_path
      end
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
