Rails.application.routes.draw do
  get "register", to: "users#new"
  post "register", to: "users#create"
  get "users", to: "users#show"
  delete "users/:id", to: "users#destroy", as: 'delete_user'
end
