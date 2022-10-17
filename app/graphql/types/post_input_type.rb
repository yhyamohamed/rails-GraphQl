# frozen_string_literal: true

module Types
  class PostInputType < Types::BaseInputObject
    argument :title, String, required: false
    argument :body, String, required: false
    argument :user_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
