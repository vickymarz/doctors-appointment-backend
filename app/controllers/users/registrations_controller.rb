# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
       render json: { user: @user }.to_json, status: 200
    else
     render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation_password)
  end
end
