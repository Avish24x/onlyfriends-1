class Tag < ApplicationRecord
  belongs_to :category
  belongs_to :fake_friend
end
