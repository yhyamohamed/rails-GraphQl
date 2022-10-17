# frozen_string_literal: true

module Mutations
  class PostUpdate < BaseMutation
    description "Updates a post by id"

    field :post, Types::PostType, null: false

    argument :id, ID, required: true
    argument :data, Types::PostInputType, required: true

    def resolve(id:, data:)
      post = ::Post.find(id)
      raise GraphQL::ExecutionError.new "Error updating post", extensions: post.errors.to_hash unless post.update(**data)

      { post: post }
    end
  end
end
