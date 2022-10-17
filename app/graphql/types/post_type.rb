# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    description "a blog post "
    field :id, ID, null: false
    field :title, String
    field :body, String
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :comments, [Types::CommentType]
    field :user, Types::UserType,"post writer"
  end
end
