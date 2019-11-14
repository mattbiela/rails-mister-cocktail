class Dose < ApplicationRecord
  belongs_to :cocktail
  validates :cocktail, uniqueness: { scope: :ingredient }
  belongs_to :ingredient
  validates :description, presence: true
end
