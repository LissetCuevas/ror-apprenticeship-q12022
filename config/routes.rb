Rails.application.routes.draw do
  devise_for :users
  resources :pokemon
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pokemon#index"
end
