class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def send_feedback(message, email)
    @message = message
    @user_email = email
    mail(from: @user_email, subject: 'New Feedback')
  end
end
