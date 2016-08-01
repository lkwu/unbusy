class Booking < ActiveRecord::Base
  validates_presence_of :date, :time, :masseur, :fee
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
  

  def self.the_before_booking_day
    Booking.all.each do |b|
      if (b.date - Time.now.to_date).to_i == 1 && b.paid
        # puts(b.id)
      # User.create!(email: "howclf@gmail.com", password: "123456123")
      # else
        UserMailer.notify_comment(b, b.user).deliver_later!
      end  
    end
  end

  def self.the_delete_no_paid
    Booking.where(paid: false).delete_all
  end

  scope :expired, -> { where(paid: true).where(["date <= ?", Time.now.to_date ]) }
  scope :waiting, -> { where(paid: true).where(["date > ?", Time.now.to_date ] ) }


end
