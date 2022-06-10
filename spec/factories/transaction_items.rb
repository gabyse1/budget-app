FactoryBot.define do
  factory :transaction_item do
    name { 'fruit transaction' }
    amount { 9.99 }
    category
    user
  end
end
