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
    resources :products, only: [:show]
    resources :vendors, only: [:show]

    get 'about', to: 'static_pages#about'
    get 'contact', to: 'static_pages#contact'
    get 'terms_of_service', to: 'static_pages#terms_of_service'

    root to: 'static_pages#home'
  end
end
