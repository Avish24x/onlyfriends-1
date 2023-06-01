class FakeFriend < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user
  has_many :tags
  has_many :categories, through: :tags
  has_one_attached :photo

  validates :name, :gender, :age, :main_description, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { in: (0..5) }
end
