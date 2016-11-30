class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to restaurants_url, notice: "Account sucessfully created!"
      else
        render "new"
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def reservations
    @reservations = @user.reservations.all
  end

  private

  def user_params
      params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end

  def user_edit_params
    params.require(:user).permit(:name, :phone, :email)
  end

end
