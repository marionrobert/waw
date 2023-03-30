class ProductsController < ApplicationController
  include CurrentCart
  include ActionView::Helpers::TextHelper
  before_action :set_subcategory, except: %i[search]
  before_action :rebuild_pg_document, only: [:index]
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :set_query, only: %i[index]

  def index
    # @query = Product.ransack(params[:q])
    # @products = @query.result.joins(:subcategory).order(:name)
    @products = Product.all.order(:name)
    if params[:query].present?
      @results = PgSearch.multisearch("%#{params[:query]}%")
      result_category_name = @results.select { |element| element.searchable_type == "Category" }
      result_subcategory_name = @results.select { |element| element.searchable_type == "Subcategory" }
      result_product_name_or_description = @results.select { |element| element.searchable_type == "Product" }
      if !result_category_name.empty?
        category = Category.where(name: result_category_name[0].content)
        @products = Category.find_by(name: category[0].name).products
      elsif !result_subcategory_name.empty?
        subcategory = Subcategory.where(name: result_subcategory_name[0].content)
        @products = Subcategory.find_by(name: subcategory[0].name).products
      elsif !result_product_name_or_description.empty?
        @products = Product.name_and_description_search("%#{params[:query]}%")
      else
        @products = []
      end
    else
      @products = Product.all.order(:name)
    end

    respond_to do |format|
      format.html
      format.json do
        render json: {
          list: render_to_string(partial: "products/list", locals: { products: @products }, layout: false, formats: [:html]),
          title: pluralize(@products.size, 'Produit disponible', plural: 'Produits disponibles')
        }
      end
    end
  end

  def show
# TEST DE COMPTEUR DE VISITE
        visit = Visit.first
        if visit.nil?
          Visit.create(count: 1)
        else
          visit.increment!(:count)
        end
# FIN DU TEST

    @current_user = current_user
    @product = Product.find(params[:id])
    products = Product.where(subcategory: @product.subcategory)
    if (products.reject { |element| element.id == @product.id }).length.positive?
      @suggested_products = (products.reject { |element| element.id == @product.id }).sample(15)
    else
      @suggested_products = Product.all.sample(15)
    end
    @similar_products = Product.where("LEFT(sku, 4) = ?", @product.sku[0, 4])
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
      @product.update(product_params.except(:photos))
    else
      @product.update(product_params)
    end
    if @product.save
      # Ici il faudra changer par le vrai chemin du site web
      if request.referrer.include?(products_path)
        redirect_back(fallback_location: products_path, success: "L'article a été mis à jour")
      else
        redirect_to product_path(@product), success: "L'article #{@product.name} a bien été mis à jour"
      end
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

  def rebuild_pg_document
    PgSearch::Multisearch.rebuild(Product)
    PgSearch::Multisearch.rebuild(Category)
    PgSearch::Multisearch.rebuild(Subcategory)
  end

  def set_subcategory
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(
      :name,
      :width,
      :height,
      :orientation,
      :frame_quantity,
      :support,
      :category_id,
      :subcategory_id,
      :sku,
      :description,
      :full_description,
      :images,
      :discount_ending_date,
      :price_cents,
      :discount_price_cents,
      :stock_quantity,
      :supplier_delay,
      photos: []
    )
  end
end
