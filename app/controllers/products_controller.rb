class ProductsController < ApplicationController
  include CurrentCart
  include ActionView::Helpers::TextHelper
  before_action :set_subcategory, except: %i[search]
  before_action :rebuild_pg_document, only: [:index]
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :set_query, only: %i[index]

  def preview
    @product = Product.find(params[:id])
  end

  def index
    @categories_illustration = []

    Category.all.each do |category|
    @categories_illustration << category.photos.first
    end

    # @query = Product.ransack(params[:q])
    # @products = @query.result.joins(:subcategory).order(:name)
    @pagy, @products = pagy(Product.where(main: true).order(:name))
    # Voir config/initializers/pagy.rb pour changer la quantité de product par page
    if params[:query].present?
      @pagy, @results = pagy(PgSearch.multisearch("%#{params[:query]}%"))
      result_category_name = @results.select { |element| element.searchable_type == "Category" }
      result_subcategory_name = @results.select { |element| element.searchable_type == "Subcategory" }
      result_product_name_or_description = @results.select { |element| element.searchable_type == "Product" }
      if !result_category_name.empty?
        @pagy, category = pagy(Category.where(name: result_category_name[0].content))
        @pagy, @products = pagy(Category.find_by(name: category[0].name).products.where(main: true))
      elsif !result_subcategory_name.empty?
        @pagy, subcategory = pagy(Subcategory.where(name: result_subcategory_name[0].content))
        @pagy, @products = pagy(Subcategory.find_by(name: subcategory[0].name).products.where(main: true))
      elsif !result_product_name_or_description.empty?
        @pagy, @products = pagy(Product.where(main: true).name_and_description_search("%#{params[:query]}%"))
      else
        @products = []
      end
    else
      @pagy, @products = pagy(Product.where(main: true).order(:name))
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
    @current_user = current_user
    @product = Product.find(params[:id])
    @product = Product.find(params[:format]) if !@product
    description = @product.description
    @words = description.split(" ")
    @price = (@product.price_cents / 100.00).to_s.gsub(/\./, ',').slice(0..50)
    # gérer le cas où le prix n'a qu'un seul chiffre après la virgule
    @price += "0" if @price[-2] == ","

    @promotionnal_price = (@product.discount_price_cents / 100.00).to_s.gsub(/\./, ',').slice(0..50)
    # gérer le cas où le prix n'a qu'un seul chiffre après la virgule
    @promotionnal_price += "0" if @promotionnal_price[-2] == ","

    @discount_percent = (((@product.discount_price_cents.to_f - @product.price_cents.to_f) / @product.price_cents.to_f) * 100).round(2).to_s.gsub(/\./, ',')

    visit = @product.visit || @product.create_visit(count: 0)
    visit.increment!(:count)
    products = Product.where(subcategory: @product.subcategory).where(main: true)
    if (products.reject { |element| element.id == @product.id }).length.positive?
      @suggested_products = (products.reject { |element| element.id == @product.id }).sample(15)
    else
      @suggested_products = Product.where(main: true).sample(15)
    end
    @similar_products = Product.where(name: @product.name)

    respond_to do |format|
      format.html
      format.json { render json:
        {
          discount_percent: @discount_percent,
          discount_price_cents: @product.discount_price_cents,
          discount_ending_date: @product.discount_ending_date,
          price: @price,
          promotionnal_price: @promotionnal_price,
          orientation: @product.orientation,
          height: @product.height,
          width: @product.width,
          support: @product.support,
          frame_quantity: @product.frame_quantity,
          description: @product.description,
          full_description: @product.full_description,
          stock_quantity: @product.stock_quantity,
          supplier_delay: @product.supplier_delay,
          id: @product.id,
          similar_products: @similar_products
        }
      }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created successfully!"
      redirect_to product_path(@product), success: "Le produit \"#{@product.name}\" est généré et disponible à la vente"
    else
      flash.now[:error] = "Product creation failed. Please fix the errors below."
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
      :meta_description,
      :discount_ending_date,
      :price_cents,
      :discount_price_cents,
      :stock_quantity,
      :supplier_delay,
      :main,
      photos: []
    )
  end
end
