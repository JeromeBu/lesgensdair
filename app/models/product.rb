class Product < ApplicationRecord
  monetize :price_cents  # or :price_pennies
  validates :name, presence: true
  validates :sku, presence: true
  validates :sku, uniqueness: true

end
