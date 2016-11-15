Rails.application.routes.draw do
  devise_for :users
  root "pages#index"
  
  resources :tasks
  resources :users, only: [ :index, :show ]
end
