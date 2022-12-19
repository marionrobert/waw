class SubcategoriesController < ApplicationController
  def index
    @subcategory = Subcategory.new
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to subcategories_path, success: "Catégorie créée."
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
