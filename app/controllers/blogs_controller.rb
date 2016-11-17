class BlogsController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).all
    # 下面这个不是很明白
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
