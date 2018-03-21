class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :id

  has_many :comments
  has_many :ingredients
  belongs_to :user
end
