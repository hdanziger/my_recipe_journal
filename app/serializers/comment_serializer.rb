class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :recipe_id, :user
end
