class CreateTransactionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_items do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
