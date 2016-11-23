class Admin::SessionsController < ApplicationController
  layout 'layouts/admin'

  def new
  end

  def create
    if ENV['ADMIN_USER'].blank?
      flash.now[:error] = "未配置管理员"
      render :new
    elsif ENV['ADMIN_USER'] != params[:username]
      flash.now[:error] = "用户名错误"
      render :new
    elsif ENV['ADMIN_PASSWORD'] != params[:password]
      flash.now[:error] = '密码错误'
      render :new
    else
      flash[:notice] = '登录成功'
      session[:login] = true
      redirect_to admin_root_path
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_admin_session_path
  end
end
