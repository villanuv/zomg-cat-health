FactoryGirl.define do
  factory :cat do
    url { Faker::Company.logo }
    description { Faker::Lorem.sentence }
    user_id { Faker::Number.digit }
  end

  factory :invalid_cat, parent: :cat do
    url nil
    description { Faker::Lorem.sentence }
    user_id '1'
  end

  factory :invalid_cat_desc, parent: :cat do
    url { Faker::Company.logo }
    description nil
    user_id '1'
  end
end