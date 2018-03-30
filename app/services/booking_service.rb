class BookingService
  class << self
    def create(booking_handler)
      puts 'Creating booking record'
      user = booking_handler.user
      booking_params = booking_handler.booking_params
      user.bookings.create(booking_params)
    end
  end
end
