module Secured
  extend ActiveSupport::Concern

  # Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # Confirms a not logged-in user
  def not_logged_in_user
    unless not logged_in?
      redirect_to current_user
    end
  end
end
