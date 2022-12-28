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
    @product.update(product_params)
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

  def search
    if params.dig(:name_search).present?
      # @products = Product.where('name ILIKE ?', "%#{params[:name_search]}%").order(created_at: :desc)
      @products = Product.global_search(params[:name_search]).order(created_at: :desc)
    else
      @products = []
    end
    respond_to do |format|
      format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("search_results",
            partial: "products/search_results",
            locals: { products: @products })
          ]
      end
    end
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
