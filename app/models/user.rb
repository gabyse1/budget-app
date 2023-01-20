class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :categories, class_name: 'Category', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :transaction_items, class_name: 'TransactionItem', foreign_key: 'user_id', inverse_of: :user,
                               dependent: :destroy

  validates :name, presence: true
end
