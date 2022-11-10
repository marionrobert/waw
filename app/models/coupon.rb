class Coupon < ApplicationRecord
  validates :name, :code, presence: true
  validates :redeem_by, comparison: { greater_than: Time.now }
  validates :amount_off, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :percent_off, numericality: { only_integer: true, greater_than: 0, less_than: 101 }, allow_blank: true
  validates :max_redemptions, numericality: { only_integer: true, greater_than: 0 }
  validates :minimum_amount, numericality: { only_integer: true, greater_than: 0 }

  # validate :amount_off_xor_percent_off
  # validate :need_currency?

  # private

  # def amount_off_xor_percent_off
  #   return if amount_off.nil? ^ percent_off.nil?

  #   errors.add(:base, 'Specifiez une base de réduction: "Réduction brut" ou "Pourcentage", pas les deux')
  # end

  # def need_currency?
  #   return unless amount_off.nil?

  #   errors.add(:base, 'Specifiez une monnaie si vous faites une réduction brut')
  # end
end
