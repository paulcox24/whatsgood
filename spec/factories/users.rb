FactoryGirl.define do
  factory :user do

    factory :first_user do
      first_name "User Name"
      password 'supersecret'
      password_confirmation 'supersecret'
      sequence(:email) {|n| "user+#{n}@email.com"}
    end

    factory :second_user do
      first_name "Second username"
      password 'supersecret'
      password_confirmation 'supersecret'
      sequence(:email) {|n| "user+#{n}@email.com"}
    end    

    factory :login_user do
      first_name "username"
      password 'password'
      password_confirmation 'password'
      sequence(:email) {|n| "username+#{n}@email.com"}
      is_admin 'true'
    end

    factory :invalid_user do
      first_name "username"
      password 'nope'
      sequence(:email) {|n| "username+#{n}@email.com"}
    end
  end
end
