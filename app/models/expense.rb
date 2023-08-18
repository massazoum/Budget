class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_items
  has_many :items, through: :expense_items
end
