class Project < ApplicationRecord
  has_many :users, through: :affiliations
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :select_donation

  validates :images, presence: true

end
