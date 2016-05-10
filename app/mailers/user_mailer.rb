class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  default :from => "不忙按摩@unbusymassage.com"


  def notify_comment(booking, user)
    @booking = booking
    @user = user

    mail to: @user.email, :subject =>  "不忙按摩感謝您的預約"
  end
end
