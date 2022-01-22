Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  post 'friends/create'
  resources :friend_requests
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users

  root 'posts#index'
  get :post_newForm, controller: :posts
  get '/friends', to: 'friends#index'

end
