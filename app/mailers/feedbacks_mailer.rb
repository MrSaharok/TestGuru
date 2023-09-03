class FeedbacksMailer < ApplicationMailer

  def send_message(body, from)
    @email = from
    @body = body

    User.where(type: 'Admin').each { |admin| mail to: admin.email }
  end
end
