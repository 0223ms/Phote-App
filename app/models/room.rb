class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users,      dependent: :destroy, through: :room_users
  has_many :messages,   dependent: :destroy
end