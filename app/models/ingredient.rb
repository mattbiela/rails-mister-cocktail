class Ingredient < ApplicationRecord
  # has_many :cocktails, through: :doses, dependent: :destroy
  has_many :doses
  # belongs_to :dose
  validates :name, uniqueness: true, presence: true
end
