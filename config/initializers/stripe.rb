# config/initializers/stripe.rb

Rails.configuration.stripe = {
  publishable_key: ENV["STRIPE_PUBLISHABLE_KEY"],
  secret_key: ENV["STRIPE_SECRET_KEY"]
}

# Set the API key for Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
