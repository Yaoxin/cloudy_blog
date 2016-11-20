class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :admin_username

  protected
  def authericate_user!
    unless session[:login]
      flash[:error] = '请先登录后台管理'
      cookies[:urlback] = request.original_url
      redirect_to new_admin_session_path
    end
  end

  def admin_username
    session[:login] && ENV['ADMIN_USER']
  end
end
