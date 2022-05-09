FactoryBot.define do
  factory :item do
      item_name                 {Faker::Lorem.words}
      text                      {Faker::Lorem.sentence} 
      item_genre_id             {'3'}
      item_status_id            {'2'}
      item_shipping_cost_id     {'3'}
      prefecture_id             {'28'}
      item_shipping_days_id     {'2'}
      item_price                {Faker::Number.between(from:300,to:9999999)}

      association               :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
