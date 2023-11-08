class Rule < ApplicationRecord
  has_many :badges

  validates :text, presence: true

  def available?
    option_key ? true : Badge.find_by(rule: self).nil?
  end
end
