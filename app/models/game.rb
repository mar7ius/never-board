class Game < ApplicationRecord
  has_many_attached :photos

  CATEGORIES = ["Pinball", "Pool", "Arcade Game"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :address, :description, :price, :category, presence: true
  validates :description, length: { minimum: 50 }
  validates :price, numericality: { greater_than: 1 }
  validates :category, inclusion: { in: CATEGORIES }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
