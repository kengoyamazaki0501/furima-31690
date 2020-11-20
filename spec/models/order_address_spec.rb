require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @sell_user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @sell_user.id)
      @buy_user = FactoryBot.create(:user)
      sleep 1
      @order_address = FactoryBot.build(:order_address, user_id: @buy_user.id, item_id: @item.id )
    end

    # describe '' do
      context '購入情報が正しく保存される時' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
      end

      context '購入情報が正しく保存されるない時' do
        it 'postal_codeが空の時' do
          @order_address.postal_code =  ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_address.postal_code =  '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'country_idに誤りがある時' do
          @order_address.country_id =  1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Country is invalid. Input half-width characters.")
        end

        it 'cityが空の時' do
          # binding.pry
          @order_address.city = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it 'addressが空の時' do
          @order_address.address = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberが空の時' do
          @order_address.phone_number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberにハイフンが入っている時' do
          @order_address.phone_number = "090-1234-5678"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is not a number")
        end


      end

    # end

  end
end