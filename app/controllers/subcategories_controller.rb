class SubcategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @subcategory = Subcategory.new
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products.where(main: true)
  end

  def new
    @subcategory = Subcategory.new
    @category = Category.find(params[:category_id])
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    @category = Category.find(params[:category_id])
    @subcategory.category = @category
    if @subcategory.save
      redirect_to profile_path, success: "Sous-catégorie #{@subcategory.name} créée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @subcategory = subcategory.find(params[:id])
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    @subcategory.update(subcategory_params)
    @subcategory.user = current_user

    if @subcategory.update(subcategory_params)
      redirect_to subcategory_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subcategory.destroy
    redirect_to subcategories_path, status: :see_other
  end

private

  def subcategory_params
    params.require(:subcategory).permit(:name)
  end

end
