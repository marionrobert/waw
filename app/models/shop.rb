class Shop < ApplicationRecord

  CARD = ["card1","card2","card3","card4"]

  THEMEFONT = [
              "'Courier New', Courier, monospace",
              "'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif",
              "'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif",
              "'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif",
              "'Segoe UI', Tahoma, Geneva, Verdana, sans-serif",
              "'Times New Roman', Times, serif",
              "'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif",
              "Arial, Helvetica, sans-serif",
              "Cambria, Cochin, Georgia, Times, 'Times New Roman', serif",
              "Georgia, 'Times New Roman', Times, serif",
              "Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif",
              "Verdana, Geneva, Tahoma, sans-serif"
            ]

  belongs_to :user, dependent: :destroy
  has_many :schedules
  accepts_nested_attributes_for :schedules, allow_destroy: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :siren, presence: true, uniqueness: true, length: { minimum: 9 }
  validates :address, presence: true
  validates :phone, presence: true, length: { minimum: 10 }
  validates :card, inclusion: { in: CARD }
  validates :themefont, inclusion: { in: THEMEFONT}
  validates :juridicform, presence: true
  validates :capitalisation, presence: true
  validates :localregister, presence: true
  validates :email, presence: true
  validates :uetva, presence: true
  validates :president, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :banner
  has_one_attached :footer
  has_many_attached :photos


  # validate :check_record, on: :create #please not that validate in this case is singular

  # def check_record
  #   if Cart.all.count === 1
  #     errors[:base] << "You can only have one active advertisement"
  #   end
  # end

  # def open_weekends?
  #   schedules.exists?(weekday: [6, 7])
  # end

  # def open_after_six?
  #   schedules.where("pm_closes_at > ?", Time.parse("18:00")).exists?
  # end

  # implémenter une méthode open right_now?

end
