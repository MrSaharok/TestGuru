class Image < ApplicationRecord
  has_one :badge

  validates :url, presence: :true

  def available?
    Badge.find_by(image: self).nil?
  end
end