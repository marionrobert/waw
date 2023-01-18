class BlogpostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @blogposts = Blogpost.all
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      redirect_to blogposts_path, success: "Vous venez d'ajouter un article"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  def edit
    @blogpost = Blogpost.find(params[:id])

  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update(blogpost_params)
      redirect_to blogposts_path
    else
      render 'edit'
    end
  end

  def destroy
    @blogpost = Blogpost.find(params[:id])
    @blogpost.destroy
    redirect_to blogposts_path, success: "L'article a bien été supprimé", status: :see_other
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(
      :title,
      :content,
      photos: []
    )
  end
end
