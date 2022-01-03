Rails.application.routes.draw do
  devise_for :authors

  root to: 'authors/posts#index'

  get 'home/index'

  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
end
