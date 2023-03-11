# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.create(user_params)
    if user.valid? && user.save
      render json: admin, status: :created
      return
    end
    render json: admin.errors, status: unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
