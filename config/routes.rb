Rails.application.routes.draw do
  resources :category_field_values
  resources :items
  resources :category_fields
  resources :fields
  resources :categories
  get '/account', to: 'personal_account#index' , as: :account
  get '/administration', to: 'administrator_panel#index' , as: :administration

  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#catalog"

  get '/item_category_fields/:item_id/:category_id', to: 'category_fields#item_category_fields', as: :item_category_fields
  get '/catalog(/:category_id)', to: 'items#catalog', as: :catalog_category
end
