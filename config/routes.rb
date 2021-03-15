Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  delete 'destroy', to: 'tasks#show'

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :edit, :destroy]
  
  resources :tasks
end
