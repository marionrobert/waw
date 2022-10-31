class ShopsController < ApplicationController
  include CurrentCart

  skip_before_action :authenticate_user!, only: :show

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user

    if @shop.save
      redirect_to shop_path(@shop), success: "Votre magasin a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    @shop.user = current_user

    if @shop.save
      redirect_to shop_path(@shop), success: "Votre magasin a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @markers = [
      {
        lat: @shop.latitude,
        lng: @shop.longitude,
        info_window: render_to_string(partial: "info_window", locals: {shop: @shop}),
        image_url: helpers.asset_url("favicon.ico")
    } ]
    @weekdays = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
    @day_schedules = @shop.schedules
    @contact = Contact.new
  end

  def destroy
    @shop = Shop.destroy_all!
  end

  private

  def shop_params
    params.require(:shop).permit(
      :name,
      :description,
      :phone,
      :address,
      :siren,
      :banner,
      :footer,
      schedules_attributes: %i[id am_opens_at am_closes_at pm_opens_at pm_closes_at weekday destroy]
    )
  end
end
