class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @reviews = @user.reviews
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.errors.any?
      render :new
    else
      redirect_to @user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :birthdate)
  end
end
