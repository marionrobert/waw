class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[add_one create]
  before_action :set_line_item, only: %i[add_one show edit update destroy]
  skip_before_action :authenticate_user!, except: %i[index]



  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    # NORMALEMENT TOUT EST BON MAINTENANT
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to products_url, success: "\"#{@line_item.product.name}\" ajouté au panier"}
        format.js
        format.json { render :show, status: :created, location: @line_item, success: "Ajouté au panier" }
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
    @line_item.quantity = @line_item.quantity += 1
    @line_item.save
    render json: { quantity: @line_item.quantity }
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
    @line_item.quantity = @line_item.quantity -= 1
    @line_item.save
    render json: { quantity: @line_item.quantity }
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
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "\"#{@line_item.product.name}\" à été supprimé du panier." }
      format.json { head :no_content }
    end
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
