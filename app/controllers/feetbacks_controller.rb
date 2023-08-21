class FeedbackController < ApplicationController

  before_action :authenticate_user!

  def new; end

  def create
    email = params[:email] || current_user.email
    FeedbackMailer.send_message(params[:body], email).deliver_now
    redirect_to feedbacks_path, notice: t('feedbacks.create.send_message')
  end
end
