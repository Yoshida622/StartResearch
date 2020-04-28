FactoryBot.define do
  factory :post do
    money { '1200' }
    hour { '12:00-17:00' }
    station { '新宿' }
    location { '東京都yy市zz町1-2-3' }
    title { '心理学実験' }
    description { '20才以上 女性' }

    trait :invalid do
      money { '' }
    end
  end

  factory :kanagawa, class: Post do
    money { '1200' }
    hour { '12:00-17:00' }
    station { '横浜' }
    location { '神奈川県yy市zz町1-2-3' }
    title { '心理学実験' }
    description { '20才以上 女性' }
  end
end
