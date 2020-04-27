FactoryBot.define do
  factory :test, class: User do
    email { 'test@example.com' }
    password { 'test-test' }

    before(:create, &:skip_confirmation!)
    trait :user_with_posts do
      after(:create) do |test|
        test.application_posts << create(:post_2)
      end
    end 
  end

  factory :post_2,class: Post do
    money { '1200' }
    hour { '12:00-17:00' }
    station { '新宿' }
    location { 'xx県yy市zz町1-2-3' }
    title { '心理学実験' }
    description { '20才以上 女性' }
  end 
end
