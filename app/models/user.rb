class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password

  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,            length: { minimum: 6 }
  validates_format_of :password, with: PASSWORD_REGEX


  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を正しく入力してください'} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を正しく入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :email,               presence: true, uniqueness: true                                  
                                 
  has_many :items
  has_many :orders
end
