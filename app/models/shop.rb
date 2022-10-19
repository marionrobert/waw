class Shop < ApplicationRecord
  # HOURS = ["00h00", "00h15", "00h30", "00h45", "01h00", "01h15", "01h30", "01h45", "02h00", "02h15", "02h30", "02h45",
  #   "03h00", "03h15", "03h30", "03h45", "04h00", "04h15", "04h30", "04h45", "05h00", "05h15", "05h30", "05h45", "06h00",
  #   "06h15", "06h30", "06h45", "07h00", "07h15", "07h30", "07h45", "08h00", "08h15", "08h30", "08h45", "09h00", "09h15",
  #   "09h30", "09h45", "10h00", "10h15", "10h30", "10h45", "11h00", "11h15", "11h30", "11h45", "12h00", "12h15", "12h30",
  #   "12h45", "13h00", "13h15", "13h30", "13h45", "14h00", "14h15", "14h30", "14h45", "15h00", "15h15", "15h30", "15h45",
  #   "16h00", "16h15", "16h30", "16h45", "17h00", "17h15", "17h30", "17h45", "18h00", "18h15", "18h30", "18h45", "19h00",
  #   "19h15","19h30", "19h45", "20h00", "20h15", "20h30", "20h45", "21h00", "21h15", "21h30", "21h45", "22h00", "22h15",
  #   "22h30", "22h45","23h00", "23h15", "23h30", "23h45"]

  belongs_to :user, dependent: :destroy
  has_many :schedules
  accepts_nested_attributes_for :schedules, allow_destroy: true
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :siren, presence: true, length: { minimum: 9 }
  validates :address, presence: true
  validates :phone, presence: true, length: { minimum: 10 }

  def open_weekends?
    schedules.exists?(weekday: [6, 7])
  end

  def open_after_six?
    schedules.where("pm_closes_at > ?", Time.parse("18:00")).exists?
  end

  # implémenter une méthode open right_now?

end
