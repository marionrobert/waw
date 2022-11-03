class CouponsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      time = @coupon.redeem_by.to_time.to_i
      amount_off = @coupon.amount_off * 100 unless @coupon.amount_off.nil?
      currency = nil if @coupon.currency.blank?
      Stripe::Coupon.create({ name: @coupon.name,
                              amount_off: amount_off,
                              currency: currency,
                              duration: @coupon.duration,
                              duration_in_months: @coupon.duration_in_months,
                              percent_off: @coupon.percent_off,
                              # TODO applies_to
                              max_redemptions: @coupon.max_redemptions,
                              redeem_by: time })
      redirect_to coupon_path(@coupon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @coupon = Coupon.find(params[:id])
    @coupon.update(coupon_params)
    if @coupon.save
      redirect_to coupon_path(@coupon), success: "L'article #{@coupon.name} a bien été mis à jour"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to coupon_path, success: "L'article #{@coupon.name} a bien été supprimé", status: :see_other
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name,
                                   :amount_off,
                                   :currency,
                                   :duration,
                                   :duration_in_months,
                                   :percent_off,
                                   :applies_to,
                                   :max_redemptions,
                                   :redeem_by)
  end
end
