class ProductsController < ApplicationController
  include CurrentCart
  include ActionView::Helpers::TextHelper
  before_action :set_subcategory, except: %i[search]
  skip_before_action :authenticate_user!, only: %i[index show preview deletepreview]
  skip_before_action :set_query, only: %i[index]

  def deletepreview
  end

  def preview
    @product = Product.find(params[:id])
    if @product.main
      @product
    else
      @product = Product.where(name: @product.name).where(main: true)
    end
  end

  def index
    @categories_illustration = []
    Category.all.each do |category|
      @categories_illustration << category.photos.first
    end

    @q = Product.where(main: true).ransack(params[:q])

    if params[:sort_by] == "name_asc"
      @q.sorts = "name asc"
    elsif params[:sort_by] == "name_desc"
      @q.sorts = "name desc"
    end

    @pagy, @products = pagy(@q.result(distinct: true))

    if params[:query].present?
      @products = Product.where(main: true).name_and_metadescription_and_description_search("%#{params[:query]}%").order(:name)
    end

    respond_to do |format|
      format.html
      format.json do
        render json: {
          list: render_to_string(partial: "products/list", locals: { products: @products }, layout: false, formats: [:html]),
          title: pluralize(@products.size, 'oeuvre disponible', plural: 'oeuvres disponibles')
        }
      end
    end
  end


  def show
    @current_user = current_user
    @product = Product.find(params[:id])
    @product = Product.find(params[:format]) if !@product

    description = @product.description
    words = description.split
    words.map! { |element| element.gsub(/\./, "") }
    words.map! { |element| element.gsub(/\,/, "") }
    words.map! { |element| element.gsub(/\w\'/, "") }

    @tag_words = words.select { |word| word.length >= 4 }

    @price = (@product.price_cents / 100.00).to_s.gsub(/\./, ',').slice(0..50)
    @promotionnal_price = (@product.discount_price_cents / 100.00).to_s.gsub(/\./, ',').slice(0..50)
    # ajouter un 0 si les prix sont sous ce format 12,9 --> 12,90
    @price += "0" if @price[-2] == ","
    @promotionnal_price += "0" if @promotionnal_price[-2] == ","
    @discount_percent = (((@product.discount_price_cents.to_f - @product.price_cents.to_f) / @product.price_cents.to_f) * 100).round(2).to_s.gsub(/\./, ',')

    @main_product = Product.where(name: @product.name).where(main: true).first

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
      flash[:success] = "Le produit a été créé"
      redirect_to product_path(@product), success: "Le produit \"#{@product.name}\" est généré et disponible à la vente"
    else
      flash.now[:error] = "La création du produit a échoué. Corrigez les erreurs."
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

  def filter_by_subcat_and_orientation
  end

  private

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
      :meta_description,
      :discount_ending_date,
      :price_cents,
      :discount_price_cents,
      :stock_quantity,
      :supplier_delay,
      :main,
      :render_price,
      :fournisseur,
      :reward,
      watermarks: [],
      photos: []
    )
  end

end
