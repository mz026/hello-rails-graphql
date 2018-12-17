module Types
  class UserType < Types::BaseObject
    field :username, String, null: false
    field :age, Integer, null: false
    field :name, String, null: false
  end
end
