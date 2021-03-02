class Badge < ApplicationRecord

  RULES = %i[category first_try level]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, presence: true
end
