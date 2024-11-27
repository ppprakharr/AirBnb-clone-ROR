Rails.application.routes.draw do
  devise_for :users
  root "home#index"
namespace :api do
  resources :wishlists, only: [ :create, :destroy ]
end

  # get "up" => "rails/health#show", as: :rails_health_check
end
