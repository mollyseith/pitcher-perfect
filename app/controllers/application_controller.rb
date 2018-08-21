class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  private

  def logged_in?
    current_user.id != nil
  end

  def require_login
    redirect_to :login unless logged_in?
  end
end
