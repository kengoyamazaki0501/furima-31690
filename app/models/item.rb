class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :burden, :country, :delivery_days

  validates     :product_name,     presence: true
  validates     :explanation,      presence: true
  validates     :category_id,      presence: true
  validates     :condition_id,     presence: true
  validates     :burden_id,        presence: true
  validates     :country_id,       presence: true
  validates     :delivery_days_id, presence: true
  validates     :price,            presence: true
  validates     :image,            presence: true

  with_options numericality: { other_than: 1 } do
    validates     :category_id
    validates     :condition_id
    validates     :burden_id
    validates     :country_id
    validates     :delivery_days_id
  end



  belongs_to :user
  has_one :order
  has_one_attached :image

end
