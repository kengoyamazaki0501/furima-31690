class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :country_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :item_id 
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを入れてください"}
    validates :country_id, numericality: { other_than: 1, message: "を選択してください"}
    validates :city
    validates :address
    validates :phone_number, numericality: {with: /\A\d{10,11}\z/}
    validates :token
  end


  def save
     # オーダーの情報を保存し、「order」という変数に入れている
     order = Order.create(item_id: item_id, user_id: user_id)
     # 住所の情報を保存
     Address.create(postal_code: postal_code, country_id: country_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id  )
   end
end

