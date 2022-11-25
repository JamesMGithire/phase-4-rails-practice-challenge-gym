Rails.application.routes.draw do
  resources :memberships, only: [:create, :index, :update]
  resources :clients, only: [:show, :index, :update]
  resources :gyms, only: [:show, :delete, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
