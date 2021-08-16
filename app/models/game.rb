class Game < ApplicationRecord
  CATEGORIES = ["pinball", "pool", "arcade game"]
  belongs_to :user
  has_many :bookings
  validates :address, :description, :price, :category, presence: true
  validates :description, length: { minimum: 50 }
  validates :price, numericality: { greater_than: 1 }
  validates :category, inclusion: { in: CATEGORIES }
end
