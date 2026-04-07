class Batch < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :batches, dependent: :destroy
end
