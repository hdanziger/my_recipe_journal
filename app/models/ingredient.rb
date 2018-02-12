class Ingredient < ApplicationRecord
    validates :name, presence: :true, uniqueness:  { case_sensitive: false, message: "Ingredient must be unique"}
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    
     accepts_nested_attributes_for :recipes
     
     
     def self.alphabetical
      names = []
      self.all.collect do |ingredient|
       names << ingredient.name.capitalize
         end
       names.each.sort_by {|name| name}.join( ", ") 
   end
 
        
end


#ingredient = "SELECT ingredient_id, COUNT(*) FROM recipe_ingredients GROUP BY ingredient_id ORDER BY COUNT(*) DESC LIMIT 1"
#ingredient[0][0]
#@ingredient = Ingredient.find(params[:id])