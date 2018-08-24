Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :breweries, only: [:index, :show]
  resources :reviews
  resources :beers,  only: [:index, :show]
  resources :users
  resources :venues
  resources :relationships, only: [:create, :destroy]

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
