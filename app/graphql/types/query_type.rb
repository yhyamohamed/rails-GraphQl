module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts, [PostType], "get all posts"
    field :users, [UserType], "all users"
    field :comments, [CommentType], "all comments"

    field :post,PostType,"get a specific post" do
      argument :id, ID,required: true
    end

    def posts
      Post.all
    end
    def post(id:)
      Post.find(id)
    end
    def users
      User.all
    end

    def comments
      Comment.all
    end
  end
end
