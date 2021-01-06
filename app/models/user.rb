class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

         validates :nickname, presence: true
         validates :birthday, presence: true

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
    validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX}

          VALID_LAST_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]/
            validates :last_name, presence: true,
                    format: { with: VALID_LAST_NAME_REGEX}

                    VALID_FIRST_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]/
                    validates :first_name, presence: true,
                            format: { with: VALID_FIRST_NAME_REGEX}    

                            VALID_LAST_NAME_KANA_REGEX =/\A[ぁ-んァ-ン一-龥]/
                    validates :last_name_kana, presence: true,
                            format: { with: VALID_LAST_NAME_KANA_REGEX}                  

                            VALID_FIRST_NAME_KANA_REGEX =/\A[ぁ-んァ-ン一-龥]/
                    validates :first_name_kana, presence: true,
                            format: { with: VALID_FIRST_NAME_KANA_REGEX}                  


  
end
