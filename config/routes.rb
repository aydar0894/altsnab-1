Rails.application.routes.draw do
  resources :category_field_values
  resources :items
  resources :category_fields
  resources :fields
  resources :categories

  devise_for :users, controllers: { sessions: 'users/sessions' , registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "items#catalog"

  get '/item_category_fields/:item_id/:category_id' => 'category_fields#item_category_fields', as: :item_category_fields
end
