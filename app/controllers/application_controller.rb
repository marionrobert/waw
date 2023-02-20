class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  # The callback which stores the current location must be added before you authenticate the user
  # as `authenticate_user!` (or whatever your resource is) will halt the filter chain and redirect
  # before the location can be stored.
  before_action :store_user_location!, if: :storable_location?
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

  def set_number_icon_cart
    if @cart.line_items.count.positive?
      @cartnumber = 0
      all_quantities = []
      @cart.line_items.each do |item|
        all_quantities << item.quantity
      end
      @cartcontent = all_quantities.sum
    end
  end

  private

  # Its important that the location is NOT stored if:
  # - The request method is not GET (non idempotent)
  # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an
  #    infinite redirect loop.
  # - The request is an Ajax request as this can lead to very unexpected behaviour.
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
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
