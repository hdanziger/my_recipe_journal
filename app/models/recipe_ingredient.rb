class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient
   

  def new_quantity
      current_quantity = ActiveRecord::Base.connection.execute("SELECT quantity FROM recipe_ingredients WHERE ingredient_id = ?")[0][0]
      new_quantity = current_quantity += 1 
      updated_quantity = ActiveRecord::Base.connection.execute("UPDATE recipe_ingredients SET quantity = new_quantity WHERE ingredient_id = ?")
      updated_quantity
  end
  
  end
    
  


#"SELECT COUNT(*) FROM recipe_ingredients WHERE ingredient_id = ?";[0][0]


       





