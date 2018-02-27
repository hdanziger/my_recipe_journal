class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient
    accepts_nested_attributes_for :ingredient


   def name
       self.ingredient.name if self.ingredient
   end
   
   def name=(name)
       ingredient = Ingredient.find_or_create_by(name: name)
       self.ingredient = ingredient
   end
 end
    
  


       





