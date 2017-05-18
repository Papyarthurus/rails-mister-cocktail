class Dose < ApplicationRecord
  belongs_to :cocktail, dependent: :destroy
  belongs_to :ingredient, dependent: :destroy

  validates_uniqueness_of :cocktail_id, scope: [:ingredient_id]
end
