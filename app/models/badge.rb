class Badge < ApplicationRecord
  belongs_to :rule
  belongs_to :image

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
