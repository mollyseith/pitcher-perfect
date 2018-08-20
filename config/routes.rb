Rails.application.routes.draw do
  resources :breweries, only: [:index, :show]
  resources :reviews
  resources :beers,  only: [:index, :show]
  resources :users, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
