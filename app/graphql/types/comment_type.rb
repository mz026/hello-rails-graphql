module Types
  class CommentType < Types::BaseObject
    graphql_name "Comment"
    field :content, String, null: false
  end
end
