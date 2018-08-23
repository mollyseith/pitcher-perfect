class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :show]


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
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def edit
  end

  def update
    @user.update(user_params)

    if @user.errors.any?
      render :edit
    else
      redirect_to @user
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :birthdate,
      :password,
      :password_confirmation
    )
  end
end
