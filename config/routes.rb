Rails.application.routes.draw do
  devise_scope :user do
    get '/sign_in' => 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get '/sign_up' => 'devise/registrations#new', as: 'new_user_registration'
    post '/sign_up' => 'devise/registrations#create', as: 'user_registration'
  end

  devise_for :users

  root 'pages#index'
  delete '/tasks', to: 'tasks#bulk_destroy'

  resources :tasks
  resources :users, only: [:show]
end
