FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test.user.#{n}@example.com" }
    password { 'test.password' }
    name { 'test.user.fullname' }
    confirmed_at { Time.now }
  end
end
