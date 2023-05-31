class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :fake_friend

  validates :booking_start, :booking_end, presence: true, uniqueness: true
end
