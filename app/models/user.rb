class User < ApplicationRecord
  has_many :affiliations
  has_many :projects, through: :affiliations
  has_many :donations
  has_many :entering_the_rooms
  has_many :rooms, through: :entering_the_rooms
  has_many :messages
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
  validates :sex_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:2, message: "を入力してください" }

  # パスワードなしでユーザー情報をupdateするためのメソッド
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
