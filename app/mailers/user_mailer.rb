class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  default :from => "l9726226@gmail.com"


  def notify_comment(booking, user)
    @booking = booking
    @user = user

    mail to: user.email, :subject =>  "new post wanna check?"
  end
end
