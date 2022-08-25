class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one :address, dependent: :destroy
end

