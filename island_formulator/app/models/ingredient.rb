class Ingredient < ApplicationRecord
  # Every ingredient MUST belong to a user.
  belongs_to :user

  has_many :ingredient_tags, dependent: :destroy
  has_many :tags, through: :ingredient_tags
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
  has_many :inventory_items, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :user, presence: true  # Ensures no orphaned ingredients

  def current_unit_price
    in_stock = inventory_items.where("quantity > 0")
    nil if in_stock.empty?

    total_value = in_stock.sum { |item| item.unit_price * item.quantity }
    total_qty = in_stock.sum(:quantity)
    total_value/total_qty
  end
  def total_qty
    inventory_items.sum(:quantity)
  end
  def unit
    units = inventory_items.distinct.pluck(:unit)
    return nil if units.empty
    units.first if units.one?
  end
end
