FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name }
    password 'password'
    password_confirmation 'password'
  end

  factory :invalid_user, parent: :user do
    username nil
  end

  factory :invalid_user_pw, parent: :user do
    password nil
  end

  factory :invalid_user_conf, parent: :user do
    password_confirmation nil
  end
end