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



                                            
          # with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
          #     validates :last_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
          #     validates :first_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
          # end

          # with_options format: format: {with: /\A[ァ-ヶー－]+\z/ } do
          #   validates :last_name_kana,      presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
          #   validates :first_name_kana,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
          # end
          #   validates :birthday,            presence: true
          # end
         
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
