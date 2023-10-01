class FeedbackMailer < ApplicationMailer
  def send_message(body, email)
    @email = email
    @body = body

    User.where(type: 'Admin').each { |admin| mail to: admin.email }
  end
end
