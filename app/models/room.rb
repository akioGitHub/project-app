class Room < ApplicationRecord
  has_many :entering_the_rooms
  has_many :users, through: :entering_the_rooms, validate: false
  has_many :messages
  belongs_to :project
end
