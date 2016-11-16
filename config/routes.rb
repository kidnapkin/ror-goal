Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  delete  '/tasks',  to: 'tasks#bulk_destroy'
  
  resources :tasks
  resources :users, only: [:show]
end