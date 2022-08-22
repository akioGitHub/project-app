class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :house_number, :building_name,
                :phone_number, :price, :donation_id, :user_id, :project_id
  with_options presence: true do
    validates :prefecture_id, :municipality, :house_number, :phone_number, :project_id, :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "を-を含む数字で入力してください"}
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 1000000, message: "を1〜1000000までの数字で入力してください"}
  end
  def save
    donation = Donation.create(price: price, user_id: user_id, project_id: project_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,
                   house_number: house_number, building_name: building_name,
                   phone_number: phone_number, donation_id: donation.id)
  end
end