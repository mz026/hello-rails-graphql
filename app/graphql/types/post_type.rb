module Types
  PostType = GraphQL::ObjectType.define do
    name "Post"
    field :id, !types.Int
    field :user_id, !types.Int
    field :title, !types.String

    field :comments, types[Types::CommentType] do
      resolve -> (obj, args, context) {
        AssociationLoader.for(Post, :comments).load(obj)
      }
    end
    field :comments_count, !types.Int do
      resolve -> (obj, arg, ctx) {
        obj.comments.count
      }
    end
    field :user, Types::UserType do
      resolve -> (obj, args, context) {
        AssociationLoader.for(Post, :user).load(obj)
      }
    end
  end
end
