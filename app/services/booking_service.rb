class BookingService
  class << self
    def create(booking_handler)
      rental = booking_handler.rental
      booking_params = booking_handler.booking_params
      booking_params[:user] = booking_handler.user
      booking = rental.bookings.create!(booking_params)
    end
  end
end
