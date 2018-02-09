class Recipe < ApplicationRecord
    validates :title, presence: :true
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user
    
    accepts_nested_attributes_for :ingredients

 
end
