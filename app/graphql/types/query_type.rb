Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user, Types::UserType do
    argument :id, types.Int
    resolve -> (obj, args, ctx) {
      User.find(args[:id])
    }
  end

  field :posts, types[Types::PostType] do
    resolve -> (obj, args, ctx) {
      Post.all
    }
  end

  field :users, types[Types::UserType] do
    resolve -> (obj, args, ctx) {
      User.all
    }
  end
end
