Rails.application.routes.draw do
  namespace :admin do
      resources :products
      resources :parts
      resources :options
      resources :product_rules
      root to: "products#index"

    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
      resource :cart, only: [:show] do
        post 'add_item', to: 'carts#add_item'
      end
    end
  end
end
