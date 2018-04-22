Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  devise_for :users

  resources :categories
  resources :products
  resources :vendors

  namespace :admin do
    resources :users
    resources :products
    resources :categories
    resources :vendors

    root to: "users#index"
  end
end
