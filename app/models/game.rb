class Game < ApplicationRecord
  CATEGORIES = ["pinball", "pool", "arcade game"]
  belongs_to :user
  has_many :bookings
  validates :address, :description, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :category, inclusion: { in: CATEGORIES }
end
