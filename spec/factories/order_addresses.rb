FactoryBot.define do
  factory :order_address do

    post_cord { '123-4567' }
    send_area_id { '2' }
    city { '大阪' }
    address_detail { '野3-3' }
    phone_number { 00000000000 }
    token { '1-1' }
    
    
  end
end
