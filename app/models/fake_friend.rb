class FakeFriend < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user

  validates :name, :gender, :age, :main_description, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { in: (0..5) }
end
