class Recipe < ApplicationRecord
    validates :title, presence: :true, uniqueness:  { case_sensitive: false}
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user
    
    accepts_nested_attributes_for :ingredients
    
    
   def add_quantity(ingredient_id)
      if ingredient_ids.include?(ingredient.to_i)
            current = recipe_ingredients.find_by(ingredient_id: ingredient_id)
            current.quantity += 1
            current
        else 
            recipe_ingredients.build(ingredient_id: ingredient_id)
        end
    end
 
end
