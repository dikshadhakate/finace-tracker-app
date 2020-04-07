Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio' 
  get 'search_stock', to: 'stocks#search' 
  get 'friends', to: 'users#friends'
  get 'search_friend', to: 'users#search_friend'
  get 'users/:id', to: 'users#show', as: '/user'
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
end
