class Room < ApplicationRecord
  has_many :entering_the_rooms, dependent: :destroy
  has_many :users, through: :entering_the_rooms, validate: false
  has_many :messages, dependent: :destroy
  belongs_to :project
end
