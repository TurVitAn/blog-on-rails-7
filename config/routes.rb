Rails.application.routes.draw do
  devise_for :authors

  root to: 'authors/posts#index'

  gaget 'home/index'

  scope module: 'authors' do
    resources :posts
  end
end
