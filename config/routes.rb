Rails.application.routes.draw do
  if Rails.env.development?
    authenticate :user do
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    end
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
