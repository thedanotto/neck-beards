Rails.application.routes.draw do
  root to: "timelines#index", via: :get
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
