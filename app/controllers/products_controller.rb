class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.search_by_name("%#{params[:query]}%")
    else
      @products = Product.all
    end
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

  def update
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :images, :price_cents)
  end

end
