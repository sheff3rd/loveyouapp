Rails.application.routes.draw do
  get 'subscriptions/index'
  root "subscriptions#index"

  resource :push, only: [:create, :destroy], controller: "push"
end
