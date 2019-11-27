Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :addresses
        resources :orders, only: %i(create)
      end
      resources :books
      resources :orders, only: %i(index show)
    end
  end
end
