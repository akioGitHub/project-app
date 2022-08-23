class Project < ApplicationRecord
  has_many :affiliations
  has_many :donations
  has_many :users, through: :affiliations, validate: false
  has_many :rooms
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :select_donation

  validates :image, :title, :first_detail, presence: true
  validates :category_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:13, message: "を入力してください" }
  validates :select_donation_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:2, message: "を入力してください" }

end
