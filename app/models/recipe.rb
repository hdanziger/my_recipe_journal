class Recipe < ApplicationRecord
    validates :title, presence: :true, uniqueness:  { case_sensitive: false}
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user
    
   # accepts_nested_attributes_for :ingredients
   scope :cheese, -> { joins(:ingredients).where('name = "Cheese"') }
   scope :dinner, -> { where(meal: "dinner") }
    
      def ingredients_attributes=(ingredients_attributes)
            ingredients_attributes.values.each do |ia|
        @ingredient = Ingredient.find_or_create_by(name: :name)
        self.recipe_ingredients.build(ingredient: @ingredient, quantity: ia[:recipe_ingredients][:quantity])
        end
    end
  end
 
