class Project < ApplicationRecord
  has_many :users, through: :affiliations
end
