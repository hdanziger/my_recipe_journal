class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient

    validates :quantity, presence: true
  
  end
    
  


#"SELECT COUNT(*) FROM recipe_ingredients WHERE ingredient_id = ?";[0][0]


       





