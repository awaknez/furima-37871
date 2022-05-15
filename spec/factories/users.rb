FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {"test1234test"} 
    password_confirmation {password}
    name_first_name       {'太郎'}
    name_first_name_kana  {'タロウ'}
    name_family_name      {'小暮'}
    name_family_name_kana {'コグレ'}
    birthday              {"1999-07-31"}
    nickname              {Faker::Name.name}
  end
end

