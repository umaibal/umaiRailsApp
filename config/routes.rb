Rails.application.routes.draw do

  get 'users/edit'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/query1'
  get 'users/query2'
  get 'users/query3'
  get 'users/query4'

  get 'tables/query6'

  get 'restaurants/query5'


  resources :users
  resources :restaurants

  # root 'user#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
