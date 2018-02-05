class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         has_many :recipes 


    def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  
  def add_recipe(recipe_id)
      if recipe_ids.include?(recipe_id.to_i)
        current = recipe_ingredients.find_by(recipe_id: recipe_id)
        current
      else 
        recipe_ingredients.build(recipe_id: recipe_id)
      end
    end

        
end
