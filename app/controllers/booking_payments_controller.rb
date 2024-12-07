class BookingPaymentsController < ApplicationController
    def create
        @property=Property.find(booking_payments_params[:property_id])
        stripe_price = Stripe::Price.create({
        currency: 'usd',
        unit_amount: Money.from_amount(BigDecimal(booking_payments_params[:total_amount])).cents,
        product_data: {
        name: @property.name,
    },
        })
        success_url = url_for(controller: 'booking_payments', action: 'success', only_path: false)
        stripe_session = Stripe::Checkout::Session.create({
            success_url: success_url,
            line_items: [
              {
                price: stripe_price.id,
                quantity: 1,
              },
            ],
            mode: 'payment',
          })    
          redirect_to stripe_session.url, allow_other_host: :true, status:303
    end

    def success
        raise
    end

    private
    def booking_payments_params
        params.permit(:stripeToken, 
        :checkin_date, 
        :user_id, 
        :service_fee, 
        :base_fare, 
        :total_amount,  
        :checkout_date,
        :property_id)
    end



end