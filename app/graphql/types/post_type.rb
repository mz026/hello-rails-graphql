module Types
  # class PostType < Types::BaseObject
  #   graphql_name "Post"
  #   field :title, String, null: false
  # end
  PostType = GraphQL::ObjectType.define do
    name "Post"
    field :title, !types.String
    field :comments, types[Types::CommentType]
  end
end
