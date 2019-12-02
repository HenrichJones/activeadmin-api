Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'dashboard', to: 'dashboard#index'
      resources :users do
        resources :addresses, except: %i(index)
        resources :orders, only: %i(create)
      end
      resources :books
      resources :orders, only: %i(index show)
    end
  end
end
