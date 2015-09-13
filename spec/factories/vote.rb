FactoryGirl.define do
  factory :vote do
    option { rand(0..1) }
    ip_address { Faker::Internet.ip_v4_address }
    cat_id { Faker::Number.digit }
  end
end