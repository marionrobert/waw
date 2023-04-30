class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[add_one create]
  before_action :set_number_icon_cart
  before_action :set_line_item, only: %i[add_one show edit update]
  skip_before_action :authenticate_user!, except: %i[index]

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        products_in_cart = []
        total_cart = @line_item.cart.total / 100
        @line_item.cart.line_items.each do |line_item|
          product = {
            product_id: line_item.product.id,
            line_item_id: line_item.id,
            name: line_item.product.name,
            sku: line_item.product.sku,
            quantity: line_item.quantity,
            image_source: [cl_image_path(line_item.product.photos.first.key, secure: true)],
            original_price: (line_item.product.price_cents / 100),
            discount_price: (line_item.product.discount_price_cents / 100),
            discount_percent: (((line_item.product.discount_price_cents.to_f - line_item.product.price_cents.to_f) / line_item.product.price_cents.to_f) * 100).round(2).to_s.gsub(/\./, ',')
          }
          products_in_cart << product
        end
        format.html { redirect_to products_url, success: "L'oeuvre a bien été ajoutée au panier." }
        # format.json { render json: { line_items: @line_item.cart.line_items } }
        format.json { render json:
          {
            products: products_in_cart,
            total_cart: total_cart
          }
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_url(@line_item), notice: "Le panier à été mis à jour" }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def addone
    @line_item = LineItem.find(params[:format])
    @line_item.quantity += 1
    @line_item.save
    render json: {
      quantity: @line_item.quantity,
      amount_cart: @line_item.cart.total,
      final_price: @line_item.total,
      price_promo: @line_item.total_discount,
      price_original: @line_item.total_basic
    }
    # respond_to do |format|
    #   if @line_item.save
    #     format.html { redirect_to products_path, success: "La quantité à été mise à jour" }
    #     format.json { render json: { quantity: @line_item.quantity } }
    #   else
    #     format.html { redirect_to products_path, status: :unprocessable_entity }
    #     format.json { render json: @line_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def removeone
    @line_item = LineItem.find(params[:format])
    @line_item.quantity -= 1
    @line_item.save
    render json: {
      quantity: @line_item.quantity,
      amount_cart: @line_item.cart.total,
      final_price: @line_item.total,
      price_promo: @line_item.total_discount,
      price_original: @line_item.total_basic
    }
    # respond_to do |format|
    #   if @line_item.save
    #     format.html { redirect_to products_path, success: "La quantité à été mise à jour" }
    #     format.json { render json: { quantity: @line_item.quantity } }
    #   else
    #     format.html { redirect_to products_path, status: :unprocessable_entity }
    #     format.json { render json: @line_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    render json: {
      amount_cart: @line_item.cart.total
    }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_item_params
    params.require(:line_item).permit(:cart_id, :product_id, :quantity)
  end
end
