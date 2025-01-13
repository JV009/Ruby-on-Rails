class FeedbacksController < ApplicationController
  def new
  end

  def create
    user_email = params[:user_email]
    message = params[:message]

    if user_email.present? && message.present?
      FeedbacksMailer.send_feedback(message, user_email).deliver_now
      flash[:notice] = "The message has been sent!"
      redirect_to root_path
    else
      flash[:alert] = "Something wrong"
      render :new
    end
  end
end
