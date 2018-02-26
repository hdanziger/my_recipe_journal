class Recipe < ApplicationRecord
    validates :title, presence: :true, uniqueness:  { case_sensitive: false}
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user
    
   # accepts_nested_attributes_for :ingredients
   #scope :cheese, -> { joins(:ingredients).where('name = "Cheese"') }
    scope :dinner, -> { where('meal = "dinner"') }
    

     def ingredients_attributes=(ingredients_attributes)
         self.ingredients = []
            ingredients_attributes.values.each do |ingredients_attribute|
                 if ingredients_attribute[:name] != ''
        @ingredient = Ingredient.find_or_create_by(name: ingredients_attribute[:name])
        self.ingredients << @ingredient
     
        end
    end
  end
  

 
 end
