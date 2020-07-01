class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.mentor = @user
    @booking.student = current_user
    @booking.total = @user.price * @booking.duration
    if @booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
        name: "Booking for #{@user.full_name}",
        amount: @booking.total_cents,
        currency: 'eur',
        quantity: 1
        }],
        success_url: allbookings_url,
        cancel_url: allbookings_url
      )
        @booking.update(checkout_session_id: session.id)
        redirect_to new_booking_payment_path(@booking)
    else
      redirect_to @user
      flash[:danger] = 'please select Booking date'
    end
    authorize @booking
  end

  def edit
  end

  def update
    @booking.update(status: params[:status])
    @booking.save
    redirect_to allbookings_path
    authorize @booking
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :duration)
  end
end
