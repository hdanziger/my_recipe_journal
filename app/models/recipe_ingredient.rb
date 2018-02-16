class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient

ingredients = []
    
    def quantity
        self.all.collect do |ri|
        ingredients.join << ri.ingredient_id
    end
         ingredients.reverse
    end

end



