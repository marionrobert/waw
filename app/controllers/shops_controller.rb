class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    # @lundi = Schedule.new(params[:shop]["schedules_attributes"]["0"])

    if @shop.save
      redirect_to shop_path(@shop), success: "Votre magasin a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def show
    @shop = Shop.find(params[:id])
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
      schedules_attributes: %i[id am_opens_at am_closes_at pm_opens_at pm_closes_at weekday destroy]
    )
  end
end
