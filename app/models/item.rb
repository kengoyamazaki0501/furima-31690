class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates     :product_name
    validates     :explanation
    validates     :price
    validates     :image
  end

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
  belongs_to :category, :condition, :burden, :country, :delivery_days

end
