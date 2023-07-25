require 'digest/sha1'

class User < ApplicationRecord

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings, dependent: :destroy

  has_secure_password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passing(test)
    test_passings.order(id: :desc).find_by(test: test)
  end
end
