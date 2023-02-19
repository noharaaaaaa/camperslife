Rails.application.routes.draw do
  
  resources :users, only: [:show, :edit]
  devise_for :users
  root to: "posts#index"

end
