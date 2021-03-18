Rails.application.routes.draw do
  root to: 'tasks#index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  delete 'destroy', to: 'tasks#show'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
  
  resources :tasks
end
