Rails.application.routes.draw do
  resources :notifications
  resources :following_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/users/:id/upload-image', to: 'users#upload_image'

  resources :users
end
