class Donation < ApplicationRecord
  validates :price, presence: true

  belongs_to :project
  has_one :address
end