# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    description "comment on a post "
    field :id, ID, null: false
    field :text, String
    field :post_id, Integer, null: false
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType,"comment writer"
  end
end
