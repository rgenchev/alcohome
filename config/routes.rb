Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  devise_for :users

  resources :categories
  resources :products

  namespace :admin do
    resources :users
    resources :products
    resources :categories

    root to: "users#index"
  end
end
