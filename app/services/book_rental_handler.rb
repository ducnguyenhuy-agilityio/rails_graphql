class BookRentalHandler
  include ActiveModel::Validations

  validates :user, presence: true
  validates :rental, presence: true

  attr_reader :user, :rental, :booking_params

  define_model_callbacks :initialize, only: [:after]
  define_model_callbacks :create_booking, only: [:after]

  # after_initialize :valid?
  after_create_booking :create_invoice
  after_create_booking :notify_user

  def self.execute(params, user_id)
    instance = self.new(params, user_id)
    instance.create_booking
  end

  def initialize(params, user_id)
    run_callbacks :initialize do
      @user = User.find(user_id)
      @booking_params = params
      @rental = assign_rental
    end
  end

  def create_booking
    run_callbacks :create_booking do
      @booking = BookingService.create(self)
    end
  end

  def assign_rental
    Rental.find(@booking_params[:rental_id])
  end

  private
  def create_invoice
    return unless @booking.present?
    InvoiceService.create(@booking)
  end

  def notify_user
    return unless @booking.present?
    BookingNotifier.send(@booking)
  end
end
