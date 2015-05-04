Rails.application.routes.draw do
  root 'home#index'
  resources :animals
  resources :tags
end
