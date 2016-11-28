class BlogsController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end
end
