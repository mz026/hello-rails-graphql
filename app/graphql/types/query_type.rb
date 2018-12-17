Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user, Types::UserType do
    argument :id, types.Int
    resolve -> (obj, args, ctx) {
      User.find(args[:id])
    }
  end
end
