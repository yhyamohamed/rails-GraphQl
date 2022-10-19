# frozen_string_literal: true

module Mutations
  class PostUpdate < BaseMutation
    description "Updates a post by id"

    field :post, Types::PostType
    field :errors, [Types::ErrorType], null: true

    argument :id, ID, required: true
    argument :data, Types::PostInputType, required: true

    def resolve(id:, data:)
      # post = ::Post.find(id)
      # raise GraphQL::ExecutionError.new "Error updating post", extensions: post.errors.to_hash unless post.update(**data)
      if post.update(**data)
        {
          post: post,
          errors: []
        }
      else

        errs = post.errors.map do |attr, msg|
          path = ["attr", attr.to_s.camelize(:lower)]
          {
            path: path,
            message: msg,
          }
        end
        {
          post: post,
          errors: errs
        }
      end

      { post: post }
    end

    def authorized?(id:, data:)
      @post = Post.find(id)
      if Pundit.policy(context[:current_user],post).update?
        true
      else
        error = { message: "Can't update this resource", path: [''] }
        return false, { errors: [error] }
        # raise GraphQL::ExecutionError, "You can only promote your _own_ employees"

      end

    end

    attr_reader :post
  end
end
