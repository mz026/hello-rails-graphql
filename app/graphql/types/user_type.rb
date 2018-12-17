Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :username, !types.String
  field :age, !types.Int
  field :name, !types.String
end
