class Product < ApplicationRecord
  monetize :price_cents  # or :price_pennies
  belongs_to :category
  validates :name, presence: true
  validates :sku, presence: true
  validates :sku, uniqueness: true

end
