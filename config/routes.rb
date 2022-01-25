Rails.application.routes.draw do

  get 'friends/index'
  get 'friends/destroy'
  post 'friends/create'
  post 'friends/create_request'
  post 'friends/accept_request'
  post 'friends/reject_request'
  
  post 'posts/like'
  post 'comments/like'
  resources :friend_requests

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  resources :users

  root 'posts#index'
  get :post_newForm, controller: :posts
  get '/friends', to: 'friends#index'

end
