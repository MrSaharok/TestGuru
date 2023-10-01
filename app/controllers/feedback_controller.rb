class FeedbackController < ApplicationController
  def new; end

  def create
    email = current_user.email
    FeedbackMailer.send_message(params[:body], email).deliver_now
  end
end
