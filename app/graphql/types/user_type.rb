# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime
    field :remember_created_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String
    field :username, String
    field :posts,[PostType],"user posts"
    field :comments,[CommentType],"user comments"
    field :postsCount,Integer,"user posts number"
    field :commentsCount,Integer,"user comments number"

    def postsCount
      object.posts.count
    end

    def commentsCount
      object.comments.count
    end
  end
end
