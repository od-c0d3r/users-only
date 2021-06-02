Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  post 'posts/new'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts, only: [:new, :create, :index, :show] 
end
