class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  before_action :authenticate_user!
  before_action :set_query

  # Ne fonctionne pas pour avoir les subcat partout
  before_action :set_subcategory

  skip_before_action :authenticate_user!, only: %i[set_query]

  add_flash_types :success

  before_action :reset_cookies


  def reset_cookies
    # permet en passant par le controlleur de reinitialiser les cookies et donc la modal cookies accepte reject si decommenté
    # session[:cookies_accepted] = nil
  end

  def set_query
    @query = Product.ransack(params[:q])
  end

  # Ne fonctionne pas pour avoir les subcat partout
  def set_subcategory
    @categories = Category.all
    @subcategories = Subcategory.all
  end




# comment everything below before_action if it doesnt work
  # private

  # Overwriting the sign_out redirect path method

  # def after_sign_out_path_for(resource_or_scope)
  #   if resource_or_scope == :user
  #     new_user_session_path
  #   elsif resource_or_scope == :admin
  #     new_admin_session_path
  #   else
  #     root_path
  #   end
  # end
end
