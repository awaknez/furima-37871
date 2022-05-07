FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_first_name       {Faker::Japanese::Name.first_name}
    name_first_name_kana  {name_first_name.yomi}
    name_family_name      {Faker::Japanese::Name.last_name}
    name_family_name_kana {name_family_name.yomi}
    birthday              {"1999-07-31"}
    nickname              {Faker::Name.name}
  end
end

