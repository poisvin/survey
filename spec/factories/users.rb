# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "hw_#{n}@yopmail.com" }
    password "123456"
    password_confirmation "123456"
    password_hash ""
    password_salt ""
    admin false
    registration_token ""
    verified true
  end

  factory :admin_user, parent: :user do
    sequence(:email) { |n| "hw_#{n}@yopmail.com" }
    password "123456"
    password_confirmation "123456"
    password_hash ""
    password_salt ""
    admin true
    registration_token ""
    verified true
  end


  factory :user_login, parent: :user do
  	email "helloworld@yopmail.com"
  	password "123456"
  	password_confirmation  "123456"
  end

  factory :invalid_user_login, parent: :user do
  	email "helloworld@yopmail.com"
  	password "16kghkh"
  	password_confirmation  "16sdkghkh"
  end

  factory :login_credentials, parent: :user do
    email "helloworld@yopmail.com"
    password "123456"
    verified true
  end
end
