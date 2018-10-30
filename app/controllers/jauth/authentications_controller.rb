require_dependency "jauth/application_controller"

module Jauth
  class AuthenticationsController < ApplicationController

    def sign_up
      result = Authentications::SignUp.call(params.permit(
          :email,
          :password,
          :confirm_password
      ))
      raise BadRequestError, result.errors if result.failure?

      render json: {response: I18n.t("user.sign_up.successful"), status: 201}, status: :created
    end

    def sign_in
      result = Authentications::SignIn.call(params.permit(
          :email,
          :password
      ))
      raise BadRequestError, result.errors if result.failure?

      @user = result.user
      render "users/show", status: :ok
    end

    def sign_out
    end

    def forgot_password
    end

    def reset_password
    end

    def change_password
    end
  end
end
