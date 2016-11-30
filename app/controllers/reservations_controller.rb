class ReservationsController < ApplicationController
  before_action do
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.restaurant = @restaurant
    @reservation.user_id = session[:user_id]

    if @reservation.save
      redirect_to [@restaurant, @reservation], :notice => 'Reservation created with success'
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_reservation_path(@restaurant, @reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_path
  end

  def viewall
    @reservations = @restaurant.reservations.all
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :restaurant_id, :party_size, :date, :time, :comment)
  end

end
