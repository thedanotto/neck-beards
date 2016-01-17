Rails.application.routes.draw do
  root to: "timelines#index"
  
  devise_for :users 
  resources :timelines
  
end
