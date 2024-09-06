Rails.application.routes.draw do
  get "register", to: "users#new"
  post "register", to: "users#create"
  get "users", to: "users#show"
  delete "users/:id", to: "users#destroy", as: "delete_user"
  get "users/:id/edit", to: "users#edit", as: "edit_user"
  patch "users/:id", to: "users#update", as: "update_user"
  root "users#show"
end
