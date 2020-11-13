class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,            presence: true
         validates :email,               presence: true, uniqueness: true 
                                        #  format: {with:mail.match(/@.+/)}
         validates :password,            presence: true, confirmation: true,
                                         length: {minimum:6},
                                         format: {with:(/[a-z\d]{6,}/i)}
         validates :last_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :last_name_kana,      presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday,            presence: true
         
        #  validates :nickname,            presence: true
        #  validates :email,               uniqueness: true, presence: true 
        #  validates :password,            presence: true, confirmation: true
                                         
        #  validates :last_name,           presence: true
        #  validates :first_name,          presence: true 
        #  validates :last_name_kana,      presence: true 
        #  validates :first_name_kana,     presence: true 
        #  validates :birthday,            presence: true

         has_many :items
         has_many :orders
end
