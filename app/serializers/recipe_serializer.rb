class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :id, :meal

  has_many :comments
  has_many :ingredients
  belongs_to :user
end
