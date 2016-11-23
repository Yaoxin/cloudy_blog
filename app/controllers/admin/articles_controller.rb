class Admin::ArticlesController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "创建博客成功"
      redirect_to admin_articles_path
    else
      flash[:error] = "创建失败"
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "更新博客成功"
      redirect_to admin_articles_path
    else
      flash[:error] = "更新博客失败"
      render :edit
    end
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = '删除成功'
    else
      flash[:error] = '删除失败'
    end
    redirect_to admin_articles_path
  end

  def preview
    # binding.pry
    render plain: Article.render_html(params[:content]|| "")
  end

  private
    def article_params
      params.permit(:title, :content)
    end
end
