class Admin::WeibosController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def new
    @weibo = Weibo.new
  end

  def create
    @weibo = Weibo.new(weibo_params)
    puts weibo_params
    if @weibo.save
      flash[:success] = "发布成功"
      redirect_to admin_weibos_path
    else
      flash[:error] = "创建失败"
      render :new
    end
  end

  def index
    @weibos = Weibo.order(created_at: :desc).all
  end

  def destroy
    @weibo = Weibo.find(params[:id])
    if @weibo.destroy
      flash[:success] = "删除成功"
    else
      flash[:error] = "删除失败"
    end
    redirect_to admin_weibos_path
  end

  private
    def weibo_params
      puts params
      params.permit(:cnt, :img)
    end


end
