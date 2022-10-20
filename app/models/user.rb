class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  # has_many :products
  has_one :shop
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
