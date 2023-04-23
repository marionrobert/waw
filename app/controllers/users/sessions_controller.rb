# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include GuestUser
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def new_guest
    guest_user = User.create_guest
    sign_in(:user, guest_user)
    guest_user
  end

  def login_as_guest
    guest_user = new_guest
    sign_in(:user, guest_user)
    redirect_to root_path
  end
  
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  def sign_in_as_guest_user
    user = User.find_by(email: "userguestwaw@gmail.com")
    sign_in(:user, user)
    redirect_to stored_location_for(:user) || root_path
  end


  private

  def guest_user
    User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = User.create_guest.id : session[:guest_user_id])
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
