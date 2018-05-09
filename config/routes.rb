Rails.application.routes.draw do

  resources :orders
  # root 'resto_storefront#index', as: 'resto_storefront_index'

  resources :cart_items

  get 'cart_items/show'

  resources :carts

  resources :resto_storefronts
  get 'resto_storefronts/show'

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

  get 'reservations/new'

  get 'tables/show'

  resources :users
  resources :restaurants
  resources :reservations

  resources :tables


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
