Rails.application.routes.draw do
  resources :subitems
  resources :subitem_categories
  resources :subitem_fields
  resources :shipment_informations
  resources :category_field_values
  resources :items
  resources :category_fields
  resources :fields
  resources :categories
  
  get '/account', to: 'personal_account#index' , as: :account
  get '/account/orders_history', to: 'personal_account#show_orders_history' , as: :account_orders
  get '/account/show_order/:order_id', to: 'personal_account#show_order' , as: :account_show_order
  get '/orders_management', to: 'orders#show_orders' , as: :orders_management
  get '/home', to: 'home#index', as: :home
  get '/administration', to: 'administrator_panel#index' , as: :administration
  get '/administration/users', to: 'administrator_panel#all_users' , as: :administration_users
  get '/administration/user_info/:user_id', to: 'administrator_panel#show_user_info' , as: :administration_user_info
  

  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#catalog"

  get '/item_category_fields/:item_id/:category_id', to: 'category_fields#item_category_fields', as: :item_category_fields
  get '/catalog(/:category_id)', to: 'items#catalog', as: :catalog_category
  get '/sub_catalog(/:category_id)', to: 'subitems#catalog', as: :sub_catalog_category


  post '/account/reorder/:order_id', to: 'orders#reorder' , as: :reorder
  post '/cart/add_item_with_subitems/:item_id', to: 'cart#add_item_with_subitems', as: :cart_add_item_with_subitems
  get '/cart', to: 'cart#index', as: :cart
  post '/cart/add_item/:item_id', to: 'cart#add_item', as: :cart_add_item
  post '/cart/update_subitems/:order_item_id', to: 'cart#update_subitems', as: :cart_update_subitem
  delete '/cart/delete_item/:item_id', to: 'cart#delete_item', as: :cart_delete_item
  delete '/cart/delete_subitem/:order_subitem_id', to: 'cart#delete_subitem', as: :cart_delete_subitem
  put '/cart/increment_item_count/:item_id', to: 'cart#increment_item_count', as: :cart_increment_item_count
  put '/cart/decrement_item_count/:item_id', to: 'cart#decrement_item_count', as: :cart_decrement_item_count

end
