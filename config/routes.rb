Rails.application.routes.draw do
  devise_for :users
  root "home#index"
namespace :api do
  resources :wishlists, only: [ :create, :destroy ]
end
  resources :properties, only: [ :show ] do
    resources :bookings, only: [ :new ]
  end
  resources :booking_payments, only: [:create]
  get 'booking_payments/success', to: "booking_payments#success"

  # get "up" => "rails/health#show", as: :rails_health_check
end
