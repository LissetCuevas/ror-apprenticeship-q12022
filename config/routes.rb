Rails.application.routes.draw do
  resources :types
  resources :abilities
  get 'ability/index'
  get 'ability/show'
  get 'ability/edit'
  get 'ability/update'
  get 'ability/delete'
  get 'ability/new'
  get 'ability/create'

  devise_for :users
  resources :pokemon

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
