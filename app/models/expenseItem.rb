class ExpenseItem < ApplicationRecord
  belongs_to :expense
  belongs_to :item
end
