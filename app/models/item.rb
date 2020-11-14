class Item < ApplicationRecord

  validates     :product_name,     presence: true
  validates     :explanation,      presence: true
  validates     :category_id,      presence: true
  validates     :condition_id,     presence: true
  validates     :burden_id,        presence: true
  validates     :country_id,       presence: true
  validates     :delivery_days_id, presence: true
  validates     :price,            presence: true
  validates     :image.            presence: true

  belongs_to :user
  has_one :order
  has_one_attached :image
end
