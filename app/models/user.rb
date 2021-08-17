class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games
  has_many :bookings
  has_many :client_booking, through: :games, source: :bookings
  validates :first_name, :last_name, presence: true

  # add an avatar to user:
  has_one_attached :avatar
end
