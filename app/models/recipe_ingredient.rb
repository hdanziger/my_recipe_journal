class RecipeIngredient < ApplicationRecord
    validates :name, presence: :true
    belongs_to :recipe
    belongs_to :ingredient
end
