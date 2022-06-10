class TransactionItem < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :transaction_items
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id', inverse_of: :transaction_items

  validates :name, presence: true
  validates :amount, presence: true, numericality: true, comparison: { greater_than: 0 }
end
