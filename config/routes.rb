Rails.application.routes.draw do
  devise_for :authors
  root to: 'home#index'
  get 'home/index'
  resources :posts
end
