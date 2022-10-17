# frozen_string_literal: true

module Types
  class ErrorType < Types::BaseObject
    field :message, String,null:false, description: "error message "
    field :path, [String]
  end
end
