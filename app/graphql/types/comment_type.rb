module Types
  CommentType = GraphQL::ObjectType.define do
    name 'Comment'
    field :id, !types.Int
    field :post_id, !types.Int
    field :content, !types.String
  end
end
