require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '' do
    context '商品の出品ができるとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it '商品のイメージ画像があれば保存できる' do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it '商品名が空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の画像が空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品説明が空では出品できないこと' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it '発送元の地域についての情報に誤りがあるとき' do
        @item.country_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it '発送日までの日数についての情報に誤りがあるとき' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it '価格が入力されてないとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '半角数字意外の文字が価格に入力されたとき' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it '300以下の金額が入力されたとき' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を¥300〜¥9,999,999の間で入力してください')
      end

      it '9,999,999以上の金額が入力されたとき' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を¥300〜¥9,999,999の間で入力してください')
      end
    end
  end
end
