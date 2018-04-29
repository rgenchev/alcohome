Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :passwords]

  namespace :admin do
    resources :users
    resources :products
    resources :categories
    resources :vendors

    root to: "users#index"
  end

  scope "(:locale)" do
    resources :categories, only: [:index, :show]
    resources :products, only: [:index, :show]
    resources :vendors, only: [:index, :show]

    get 'about', to: 'static_pages#about'
    get 'contact', to: 'static_pages#contact'

    root to: 'static_pages#home'
  end
end
