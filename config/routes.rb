Rails.application.routes.draw do
  root to: "timelines#index"

  devise_for :users
  resources :timelines, only: [:index]
  resources :photos, only: [:show, :new, :create]
end
