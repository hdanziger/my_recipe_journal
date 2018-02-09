class Ingredient < ApplicationRecord
    validates :name, presence: :true
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    
     accepts_nested_attributes_for :recipes
     
     
     def self.alphabetical
      self.all.each_with_index do |name|
          self.name
      end
    end
     
        
end


#ingredient = "SELECT ingredient_id, COUNT(*) FROM recipe_ingredients GROUP BY ingredient_id ORDER BY COUNT(*) DESC LIMIT 1"
#ingredient[0][0]
#@ingredient = Ingredient.find(params[:id])