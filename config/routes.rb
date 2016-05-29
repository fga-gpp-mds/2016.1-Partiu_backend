Rails.application.routes.draw do
  scope "/api" do
    get 'get_user_id', to: 'users#get_user_id'
    resources :users do
      resources :rides
      resources :vehicles
    end

    get 'rides', to: 'rides#index'
    get 'rides/:id', to: 'rides#show'
    get 'vehicles', to: 'vehicles#index'
    get 'vehicles/:id', to: 'vehicles#show'
  end
end
