class InventoryItem < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  has_one_attached :photo

  validates :ingredient_id, presence: true
  validates :purchase_date, presence: true

  def unit_price
    return nil if quantity.nil? || quantity == 0
    price_cents.to_f / quantity
  end
  def price
    price_cents.to_f / 100
  end
end
