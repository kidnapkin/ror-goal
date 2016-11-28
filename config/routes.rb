Rails.application.routes.draw do
  devise_scope :user do
    get '/login', to: 'devise/sessions#new', as: 'new_user_session_path'
    post '/login', to: 'devise/sessions#create', as: 'user_session_path'
    delete 'logout', to: 'devise/sessions#destroy'
    get '/sign_up', to:'devise/registrations#new', as: 'new_user_registration'
    post '/sign_up', to: 'devise/registrations#create', as: 'user_registration'
  end

  devise_for :users

  root 'pages#index'
  delete '/tasks', to: 'tasks#bulk_destroy'

  resources :tasks
  resources :users, only: [:show]
end
