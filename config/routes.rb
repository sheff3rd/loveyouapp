Rails.application.routes.draw do
  root "scenes#index"

  resource :push, only: [:create, :destroy], controller: "push"
  resources :scenes, only: [:index, :show], param: :slug
end
