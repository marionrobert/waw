class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  # end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_path(@product), status: :see_other
  end



    def search
      @product = Product.find(params[:product_id]).order(created_at: :desc)
    end

  def self.search(search)
    if shearch != ""
      Product.where('content Like(?) OR title Like(?),"%#{search}%", "%#{search}%"')
    else
      Product.all
    end
  end

end
