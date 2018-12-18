Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, !types.Int
  field :username, !types.String
  field :age, !types.Int
  field :name, !types.String

  field :posts, types[Types::PostType]
  field :posts_count, !types.Int do
    resolve -> (obj, arg, ctx) {
      AssociationCountLoader.for(:posts, :user_id).load(obj.id)
    }
  end
end
