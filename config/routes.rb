Rails.application.routes.draw do
  resources :posts do
    resources :likes
    resources :comments
  end 

  resources :friendships
  resources :home
  resources :friend_request
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
