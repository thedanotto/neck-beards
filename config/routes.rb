Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to: "timelines#index"
  resources :timelines, only: [:index]
  resources :photos, only: [:show, :new, :create]
end
