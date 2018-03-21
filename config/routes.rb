Rails.application.routes.draw do

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


  resources :users
  resources :restaurants
  resources :reservations

  # root 'user#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
