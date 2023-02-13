class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: "Catégorie #{@category.name} créée."
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
