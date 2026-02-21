class Ingredient < ApplicationRecord
  # Add this line:
  # This says: "Every ingredient MUST belong to a user."
  belongs_to :user
  
  has_many :ingredient_tags, dependent: :destroy
  has_many :tags, through: :ingredient_tags
  
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :user, presence: true  # Ensures no orphaned ingredients
end
