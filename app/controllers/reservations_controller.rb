class ReservationsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @restaurant, notice: "Réservation réussie !"
    else
      redirect_to @restaurant, alert: "Erreur dans la réservation."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date)
  end
end
