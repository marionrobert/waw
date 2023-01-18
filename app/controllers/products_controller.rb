class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_subcategory, except: %i[search]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.all
    @subcategories = Subcategory.all
    # if params[:query].present?
    #   sql_query = <<~SQL
    #     products.name @@ :query
    #     OR products.description @@ :query
    #     OR products.sku @@ :query
    #     OR subcategories.name @@ :query
    #   SQL
    #   @products = Product.joins(:subcategory).where(sql_query, query: "%#{params[:query]}%")
    # else
      @products = Product.all
    # end
    # VOIR CORRECTION DE LEWAGON
  end

  def show
    @current_user = current_user
    @product = Product.find(params[:id])
    products = Product.where(subcategory: @product.subcategory)
    @products = (products.reject { |element| element.id == @product.id }).sample(3)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product), success: "Le produit \"#{@product.name}\" est généré et disponible à la vente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
      if params[:product][:photos] == [""]
        @product.update(product_params).except!(:photos)
      else
      @product.update(product_params)
      end
    if @product.save
      redirect_to product_path(@product), success: "L'article #{@product.name} a bien été mis à jour"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, success: "L'article #{@product.name} a bien été supprimé", status: :see_other
  end

private

  def set_subcategory
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(
      :name,
      :category_id,
      :subcategory_id,
      :sku,
      :description,
      :images,
      :price_cents,
      :discount_price_cents,
      photos: []
    )
  end

end
