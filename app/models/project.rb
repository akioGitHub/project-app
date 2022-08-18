class Project < ApplicationRecord
  has_many :users, through: :affiliations
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :select_donation

end
