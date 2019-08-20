Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :items, only: [:new, :create, :edit, :update, :destroy]
  root 'experiences#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add_user' => 'trips#add_user'
  resources :users
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
