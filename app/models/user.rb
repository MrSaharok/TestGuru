class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :delete_all

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test: test)
  end
end
