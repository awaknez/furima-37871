FactoryBot.define do
  factory :purchase_address do
        post_number   { '123-4567' }
        prefecture_id { 14 }
        municipality  { '東京都' }
        address       { '1-1' }
        building_name { '東京ハイツ' }
        phone_number  { '09012345678' }  
        token         {"tok_abcdefghijk00000000000000000"}
  end
end
