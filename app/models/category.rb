class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :categories
  has_many :transaction_items, class_name: 'TransactionItem', foreign_key: 'category_id', inverse_of: :category,
                              dependent: :destroy
  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def category_total_amount
    total_amount = 0
    self.transaction_items.each do |ct|
      total_amount += ct.amount
    end
    total_amount
  end
end
