class CouponsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def amount_off
    @coupon = Coupon.new
  end

  def percent_off
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      time = @coupon.redeem_by.to_time.to_i
      amount_off = @coupon.amount_off * 100 unless @coupon.amount_off.nil?
      minimum_amount = @coupon.minimum_amount * 100 unless @coupon.minimum_amount.nil?
      coupon = Stripe::Coupon.create({  name: @coupon.name,
                                        amount_off: amount_off,
                                        currency: "EUR",
                                        percent_off: @coupon.percent_off,
                                        # TODO applies_to
                                        max_redemptions: @coupon.max_redemptions,
                                        redeem_by: time })
      Stripe::PromotionCode.create({  coupon: coupon.id,
                                      code: @coupon.code,
                                      max_redemptions: @coupon.max_redemptions,
                                      expires_at: time,
                                      restrictions: {  first_time_transaction: @coupon.first_time_transaction,
                                                      minimum_amount: minimum_amount,
                                                      minimum_amount_currency: "EUR" }  })
      @coupon.stripe_id = coupon.id
      @coupon.save
      redirect_to coupon_path(@coupon)
    else
      render :amount_off, status: :unprocessable_entity if @coupon.percent_off.nil?
      render :percent_off, status: :unprocessable_entity if @coupon.amount_off.nil?
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
    Stripe::Coupon.delete(@coupon.stripe_id)
    @coupon.destroy
    redirect_to coupons_path, success: "Le #{@coupon.name} a bien été supprimé", status: :see_other
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
                                   :redeem_by,
                                   :code,
                                   :stripe_id,
                                   :first_time_transaction,
                                   :minimum_amount)
  end
end
