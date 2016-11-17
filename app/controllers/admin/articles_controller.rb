class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = '删除成功'
    else
      flash[:error] = '删除失败'
    end
    # @articles = Article.all
    # render 'index'
    redirect_to articles_path
  end
end
