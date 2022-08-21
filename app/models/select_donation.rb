class SelectDonation < ActiveHash::Base
  self.data = [
    { id: 1, name: 'する' },
    { id: 2, name: 'しない' }
  ]

  include ActiveHash::Associations
  has_many :projects
end