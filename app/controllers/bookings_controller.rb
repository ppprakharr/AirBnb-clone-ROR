class BookingsController < ApplicationController
    def new
        @property = Property.find(params[:property_id])
        @checkin_date = Date.parse(params[:checkin_date])
        @checkout_date = Date.parse(params[:checkout_date])
        @number_of_night = numberOfNights()
        @base_fare = (@property.price * @number_of_night).round(2)
        @service_fee = @base_fare * 0.18
        @total_fare = @base_fare + @service_fee
    end

    private

    def numberOfNights
        checkinDate = Date.parse(params[:checkin_date])
        checkoutDate = Date.parse(params[:checkout_date])
        (checkoutDate - checkinDate).to_i
    end

    def bookings_param
        params.permit(:checkin_date, :checkout_date, :property_id)
    end
end