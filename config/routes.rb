Rails.application.routes.draw do
  devise_for :users
  root "home#index"
namespace :api do
  resources :wishlists, only: [ :create, :destroy ]
end
  resources :properties, only: [ :show ] do
    resources :bookings, only: [ :new ]
  end
  resources :booking_payments, only: [ :create ]
  get "booking_payments/success", to: "booking_payments#success"
  resources :wishlists, only: [ :index ]
  resource :profile, only: [ :edit, :update ]
  resource :email, only: [ :update, :edit ]
  resource :password, only: [ :edit, :update ]
  resources :reservations, only: [ :index ] do
    resources :reviews, only: [ :new, :create ]
  end

  namespace :owner do
    resources :properties do
      member do
        patch "update_amenities"
        delete "remove_image"
      end
    end
    resources :reservations, only: [ :index ]
    resources :dashboard, only: [ :index ]
  end

  # get "up" => "rails/health#show", as: :rails_health_check
end
