class Recipe < ApplicationRecord
    validates :title, presence: :true
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user
    
    #def add_ingredient(ingredient_id) add an ingredient to a recipe 
end
