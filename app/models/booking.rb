class Booking < ActiveRecord::Base
  validates_presence_of :date, :time
# ---------------------------------------------------------------
  # validates :morning, presence: true, unless: :afternoon
  # validates :afternoon, presence: true, unless: :morning

  # validate :check_morning_or_afternoon

  # def check_morning_or_afternoon
  #   if self.morning.blank? && self.afternoon.blank?
  #       errors[:base] = "日期或時間一定要輸入其中一個"
  #   end
  # end
# ------------------------------------------------------------------

  has_many :payments

  belongs_to :user










  # def self.remaining_of_masseur_morning( date )
  #     masseur=Booking.where( date: date.to_date, morning: true).sum(:masseur)
  #     return 10 - masseur
  # end
  
  # def self.remaining_of_masseur_afternoon( date )
  #     masseur=Booking.where( date: date.to_date, afternoon: true).sum(:masseur)
  #     return 10 - masseur
  # end






end
