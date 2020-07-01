class PaymentsController < ApplicationController
   def new
    @booking = current_user.sent_bookings.pending.find(params[:booking_id])
    authorize(@booking, policy_class: PaymentPolicy)

   end
end
