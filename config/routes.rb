Rails.application.routes.draw do
  resources :category_field_values
  resources :items
  resources :category_fields
  resources :fields
  resources :categories
  get '/account', to: 'personal_account#index' , as: :account
  get '/home', to: 'home#index', as: :home

  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#catalog"

  get '/item_category_fields/:item_id/:category_id', to: 'category_fields#item_category_fields', as: :item_category_fields
  get '/catalog(/:category_id)', to: 'items#catalog', as: :catalog_category
  post '/orders/add_to_cart/:item_id', to: 'orders#add_to_cart', as: :add_to_cart
  delete '/orders/delete_from_cart/:item_id', to: 'orders#delete_from_cart', as: :delete_from_cart
  put '/orders/increment_cart_item_count/:item_id', to: 'orders#increment_cart_item_count', as: :increment_cart_item_count
  put '/orders/decrement_cart_item_count/:item_id', to: 'orders#decrement_cart_item_count', as: :decrement_cart_item_count
  get '/cart', to: 'orders#cart', as: :cart
end
