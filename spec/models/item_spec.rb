require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '' do
    context '商品の出品ができるとき' do
      it "全ての情報が存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it "商品のイメージ画像があれば保存できる" do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it "商品名が空では出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "商品の画像が空では出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品説明が空では出品できないこと" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態についての情報が必須であること" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担についての情報が必須であること" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it "発送元の地域についての情報に誤りがあるとき" do
        @item.country_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Country must be other than 1")
      end

      it "発送日までの日数についての情報に誤りがあるとき" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end

      it "価格が入力されてないとき" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "半角数字意外の文字が価格に入力されたとき" do
        @item.price = "１１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "300以下の金額が入力されたとき" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not range")
      end

      it "9,999,999以上の金額が入力されたとき" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not range")
      end
    end
  end
end

      