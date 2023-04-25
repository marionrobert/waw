module CurrentCart
  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    @user = current_user
    session[:cart_id] ||= @cart.id
  end

  def set_number_icon_cart
    set_cart
    @cartnumber = 0
    all_quantities = []
    @cart.line_items.each do |item|
      all_quantities << item.quantity
    end
    @cartcontent = all_quantities.sum
  end
end
