FactoryBot.define do
  factory :transaction_item do
    name { "MyString" }
    amount { "9.99" }
    user { nil }
    category { nil }
  end
end
