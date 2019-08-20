Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :items, only: [:new, :create, :edit, :update, :destroy]
  resources :users
  resources :trips
  root 'experiences#start'
  get '/login' => 'sessions#new'
  get '/home' => 'experiences#index'
  get '/signup' => 'users#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add_user' => 'trips#add_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
