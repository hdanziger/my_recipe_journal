class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :id

  has_many :comments
  belongs_to :user
end
