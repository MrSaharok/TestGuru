class Feedback < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :email, :body, presence: true
end
