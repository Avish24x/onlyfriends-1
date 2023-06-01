class Category < ApplicationRecord
  has_many :tags
  has_many :fake_friends, through: :tags
end
