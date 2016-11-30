class RestaurantsController < ApplicationController
  before_action      :find_user
  skip_before_action :find_user, only: [:index, :show, :edit, :update, :destroy]

  def index
     @restaurants = Restaurant.all
    # @show = Restaurant.find_by_first_letter('a')
    # @restaurants = Restaurant.search(params[:search])
    if params[:search]
   @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
 else
   @restaurants = Restaurant.all.order('created_at DESC')
 end

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner_id = params[:user_id]
    if @restaurant.save
      redirect_to [@user, @restaurant]
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_url(@restaurant), :notice => 'Restaurant created with success'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    owner = @restaurant.owner_id
    @reservations = @restaurant.reservations
    @reservations.destroy
    @restaurant.destroy
    redirect_to user_path(owner)
  end

  def owner_show_page
    @restaurant = Restaurant.find_by(@user)

  end

  def default_photo
    'image.jpg'
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :capacity, :opening_hours, :closing_hours, :website, :photo)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
