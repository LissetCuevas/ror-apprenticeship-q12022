Rails.application.routes.draw do
  devise_for :users
  resources :pokemon
  # resources :ability
  # resources :type

  # Pokemon API
  namespace :api do
    namespace :v1 do
      resources :pokemon
    end
  end

  # Abilities API
  # namespace :api do
  #   namespace :v1 do
  #     namespace :pokemon do
  #       resources :abilitites
  #     end
  #   end
  # end

  # Types API
  # namespace :api do
  #   namespace :v1 do
  #     namespace :pokemon do
  #       resources :type
  #     end
  #   end
  # end

  # Defines the root path route ("/")
  root "pokemon#index"
end
