class User < ApplicationRecord
  has_many :bookings
  has_many :fake_friends, through: :bookings
  has_many :fake_friends

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
