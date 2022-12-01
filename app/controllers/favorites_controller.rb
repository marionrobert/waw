class FavoritesController < ApplicationController
    def create
        if Favorite.find_by(user: current_user, product: Product.find(params[:product_id]))
            Favorite.find_by(user: current_user, product: Product.find(params[:product_id])).destroy
            render json: { product_id: params[:product_id], unfav: true, page: params["page"] }
        else
            Favorite.create!(user: current_user, product: Product.find(params[:product_id]))
            render json: { product_id: params[:product_id], unfav: false, page: params["page"] }
        end
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        redirect_to root_path
    end

    private

    def favorite_params
        params.permit(:user_id, :product_id)
    end
end
