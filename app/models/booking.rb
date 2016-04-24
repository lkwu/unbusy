class Booking < ActiveRecord::Base
  validates_presence_of :date


# ---------------------------------------------------------------
  validates :morning, presence: true, unless: :afternoon
  validates :afternoon, presence: true, unless: :morning

  # validate :check_morning_or_afternoon

  # def check_morning_or_afternoon
  #   if self.morning.blank? && self.afternoon.blank?
  #       errors[:base] = "日期或時間一定要輸入其中一個"
  #   end
  # end
# ------------------------------------------------------------------

  has_many :payments

end
