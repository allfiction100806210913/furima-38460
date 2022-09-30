FactoryBot.define do
  
  factory :order_purchase_record do
    transient do
      person { Gimei.name }
    end
    
    building{ '' }
    token{ 'abcdefghi' }
    city             { '長野県松本市' }
    addresses                {'青山1-1-1'}
    phone_number              {'09012345678'}
    prefecture_id             { 20 }
    postal_code             {'399-0033'}

  end
end








