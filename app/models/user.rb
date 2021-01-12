class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_one :order



         with_options presence: true do
                validates :nickname
                validates :birthday
                validates :password, format:{with:/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/}

                with_options format: {with:/\A[ぁ-んァ-ン一-龥]/} do
                        validates :last_name
                        validates :first_name
                end

                with_options format: {with:/\A[ァ-ヶー－]+\z/} do
                        validates :last_name_kana
                        validates :first_name_kana
                end


                 
         end






  
end
