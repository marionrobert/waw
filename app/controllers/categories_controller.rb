class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save

      redirect_to categories_path, success: "Catégorie créée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    @category.user = current_user

    if @category.update(category_params)
      redirect_to category_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

private

  def category_params
    params.require(:category).permit(:name)
  end

end
