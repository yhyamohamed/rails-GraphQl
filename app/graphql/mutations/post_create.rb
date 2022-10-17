# frozen_string_literal: true

module Mutations
  class PostCreate < BaseMutation
    description "Creates a new post"

    field :post, Types::PostType, null: false

    # argument :post_input, Types::PostInputType, required: true
    #
    argument :title, String, required: false
    argument :body, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

    def resolve(**post_input)
      post = ::Post.new(**post_input)
      post.user = context[:current_user]
      raise GraphQL::ExecutionError.new "Error creating post", extensions: post.errors.to_hash unless post.save

      { post: post }
    end
  end
end
