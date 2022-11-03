class Coupon < ApplicationRecord
  validates :name, :duration, presence: true


  validate :amount_off_xor_percent_off
  validate :need_currency?

  private

  def amount_off_xor_percent_off
    return if amount_off.nil? ^ percent_off.nil?

    errors.add(:base, 'Specifiez une base de réduction: "Réduction brut" ou "Pourcentage", pas les deux')
  end

  def need_currency?
    return if amount_off.nil?

    errors.add(:base, 'Specifiez une monnaie si vous faites une réduction brut')
  end
end
