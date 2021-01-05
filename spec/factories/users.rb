FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name              {"森"}
    first_name              {"森"}
    last_name_kana              {"モリ"}
    first_name_kana              {"モリ"}
    birthday              {"2020/01/01"}
  end
end