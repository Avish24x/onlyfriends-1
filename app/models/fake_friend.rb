class FakeFriend < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags

  validates :name, :gender, :age, :main_description, :price, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { in: (0..5) }
end
