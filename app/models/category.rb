class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :categories
  has_many :transaction_item, class_name: 'TransactionItem', foreign_key: 'category_id', inverse_of: :category,
                              dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
