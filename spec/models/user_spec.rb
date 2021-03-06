require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが英数混合であれば登録できる' do
        @user.nickname = 'a1a1a1a1'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'q1q1q1q1'
        @user.password_confirmation = 'q1q1q1q1'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailが＠かなければ登録できないこと' do
        @user.email = 'tarou.yamada.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'tarouyamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = 'YAMADA０１０１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'yamade01'
        @user.valid?
        expect(@user.errors.full_messages).to include('名を正しく入力してください')
      end

      it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'tarou01'
        @user.valid?
        expect(@user.errors.full_messages).to include('性を正しく入力してください')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)を正しく入力してください")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性(カナ)を正しく入力してください")
      end

      it 'last_name_kanaには【カタカナ】意外登録できない' do
        @user.last_name_kana = 'たろう１'
        @user.valid?
        expect(@user.errors.full_messages).to include('名(カナ)を正しく入力してください')
      end

      it 'first_name_kanaには【カタカナ】意外登録できない' do
        @user.first_name_kana = 'たろう１'
        @user.valid?
        expect(@user.errors.full_messages).to include('性(カナ)を正しく入力してください')
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
