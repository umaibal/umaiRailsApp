Rails.application.routes.draw do

  resources :cart_items
  resources :carts
  resources :resto_storefronts
  resources :controllers
  get 'users/edit'
  get 'users/index'
  get 'users/new'
  get 'users/show'

  get 'users/query1'

  get 'reservations/query2'
  get 'reservations/query3'
  get 'reservations/query4'

  get 'restaurants/query5'

  get 'reservations/query6'
  get 'reservations/query7'
  get 'reservations/query8'

  get 'tables/show'

  # get 'resto_storefronts/show'

  resources :users
  resources :restaurants
  resources :reservations

  resources :tables


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
