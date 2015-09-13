FactoryGirl.define do
  factory :cat do
    url { Faker::Company.logo }
    description { Faker::Lorem.sentence }
    user_id { Faker::Number.digit }
  end

  factory :invalid_cat, parent: :cat do
    url nil
  end
end