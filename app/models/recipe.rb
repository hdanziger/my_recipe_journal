class Recipe < ApplicationRecord
    validates :title, presence: :true, uniqueness:  { case_sensitive: false}
    validates :meal, case_sensitive: false
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user
    before_validation :uppercase_meal
    
   # accepts_nested_attributes_for :ingredients
   #scope :cheese, -> { joins(:ingredients).where('name = "Cheese"') }
    scope :dinner, -> { where(:meal => "Dinner")}
    
    def recipe_ingredients_attributes=(recipe_ingredients_attributes)
        #binding.pry
        recipe_ingredients_attributes.values.each do |recipe_ingredients_attribute|
            if recipe_ingredients_attribute[:name] != ''
                ingredient = Ingredient.find_or_create_by(name: recipe_ingredients_attribute[:name])
                recipe_ingredient = self.recipe_ingredients.find_or_initialize_by(ingredient: ingredient)
                quantity = recipe_ingredient.update_attributes(recipe_ingredients_attribute)
    
            end
        end
    end
  
    def uppercase_meal
         meal.capitalize! 
    end

 end
