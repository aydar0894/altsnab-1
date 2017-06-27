Rails.application.routes.draw do
  resources :category_field_values
  resources :items
  resources :category_fields
  resources :fields
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
