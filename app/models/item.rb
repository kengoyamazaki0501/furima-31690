class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates     :product_name
    validates     :explanation
    validates     :image
    validates     :price, numericality: { with: /\A[0-9]+\z/ }
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: 'を¥300〜¥9,999,999の間で入力してください'

  with_options presence: true, numericality: { other_than: 1, message:'を選択してください' } do
    validates     :category_id
    validates     :condition_id
    validates     :burden_id
    validates     :country_id
    validates     :delivery_day_id
  end

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :country
  belongs_to_active_hash :delivery_day

  belongs_to :user
  has_one :order
  has_one_attached :image
end
