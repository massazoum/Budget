class Item < ApplicationRecord
  belongs_to :user
  has_many :expense_items
  has_many :expenses, through: :expense_items

  has_one_attached :icon
  validates :name, presence: true
end
