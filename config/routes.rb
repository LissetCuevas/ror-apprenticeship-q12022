Rails.application.routes.draw do
  devise_for :users
  resources :pokemon
  # resources :ability
  # resources :type

  # Pokemon API
  namespace :api do
    namespace :v1 do
      resources :pokemon, only: [:index, :show]
    end
  end

  # Abilities API
  namespace :api do
    namespace :v1 do
      resources :ability, only: [:index, :show]
    end
  end

  # Types API
  namespace :api do
    namespace :v1 do
      resources :type, only: [:index, :show]
    end
  end

  # Defines the root path route ("/")
  root "pokemon#index"
end
