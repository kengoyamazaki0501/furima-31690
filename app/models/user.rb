class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
            validates :nickname
            validates :birthday            
         end

         with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
           validates :last_name
           validates :first_name
         end

         with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
            validates :last_name_kana
            validates :first_name_kana
         end

            validates :email,               presence: true, uniqueness: true 
                                          #  format: {with:mail.match(/@.+/)}
            validates :password,            presence: true, confirmation: true,
                                            length: {minimum:6},
                                            format: {with:(/[a-z\d]{6,}/i)}
         has_many :items
         has_many :orders
end
