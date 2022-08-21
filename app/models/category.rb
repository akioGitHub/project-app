class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '商品開発' },
    { id: 2, name: '広告' },
    { id: 3, name: '流通' },
    { id: 4, name: '芸能' },
    { id: 5, name: '政治' },
    { id: 6, name: '地域活性化' },
    { id: 7, name: 'エンターテイメント' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: '美容' },
    { id: 10, name: 'ファッション' },
    { id: 11, name: '飲食店' },
    { id: 12, name: 'チャリティー' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :projects

  end