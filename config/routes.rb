Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  devise_for :users, skip: [:registrations, :passwords]

  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :vendors, only: [:index, :show]

  namespace :admin do
    resources :users
    resources :products
    resources :categories
    resources :vendors

    root to: "users#index"
  end

  get '*path' => redirect('/')
end
