Rails.application.routes.draw do
  get 'table/query6'

  get 'restaurant/query5'

  get 'user/query1'

  get 'users/edit'
  get 'users/index'
  get 'users/new'
  get 'users/show'


  resources :users
  resources :restaurants

  # root 'user#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
