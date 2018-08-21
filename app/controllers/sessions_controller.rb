class SessionsController < ApplicationController
  def new
  end

  def create
    params.inspect
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    if !(session[:user_id].nil?)
      session.delete :user_id
    end
    redirect_to :login
  end
end
