class Product < ApplicationRecord
  monetize :price_cents  # or :price_pennies
  belongs_to :category
  validates :name, presence: true

end
