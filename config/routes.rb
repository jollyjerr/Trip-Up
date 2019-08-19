Rails.application.routes.draw do
  resources :posts
  resources :items
  root 'experiences#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :edit, :destroy]
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
