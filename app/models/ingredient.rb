class Ingredient < ApplicationRecord
    validates :name, presence: :true, uniqueness:  { case_sensitive: false}
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    
     #accepts_nested_attributes_for :recipe_ingredients
   
     
     
     def self.alphabetical
      names = []
      self.all.collect do |ingredient|
       names << ingredient.name.capitalize
         end
       names.each.sort_by {|name| name}.join( ", ") 
   end
 
        
end


