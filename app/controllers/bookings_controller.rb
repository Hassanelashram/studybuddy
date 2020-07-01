class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.mentor = @user
    @booking.student = current_user
    if @booking.save
      redirect_to dashboard_path
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
    redirect_to dashboard_path
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
