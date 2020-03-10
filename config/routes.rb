Rails.application.routes.draw do
  resources :messages
  # resources :notifications
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/users/:id/upload-image', to: 'users#upload_image'

  post 'users/:id/follow', to: 'users#follow'

  post 'messages/:id/new', to: 'messages#create'

  get 'users/:id/inbox', to: 'messages#inbox'

  get 'users/:id/notifications', to: 'notifications#index'


  # post 'users/:id/follow' => 'users#follow', as: "follow_user"
  # get 'users/:id/followers' => 'users#followers', as: "users_following"
  # post 'users/:id/following' => 'users#following', as: "following_users"

  resources :users
end
