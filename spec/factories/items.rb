FactoryBot.define do
  
  factory :item do
    transient do
      person { Gimei.name }
    end
    
    item_name             {Faker::Lorem.sentence}
    item_text             {Faker::Lorem.sentence}
    category_id              {'1'}
    status_id                {'1'}
    shipping_status_id            {'1'}
    prefecture_id            {'1'}
    scheduled_delivery_id       {'1'}
    price                      {'9999999'}
    user_id                 {'1'}
    association :user
    image               {Faker::Lorem.sentence}

  end
end
