class CommentsController < ApplicationController
  def index
  end

  def create
    @article = Article.find(params[:blog_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = "评论成功"
    else
      flash[:error] = "评论失败"
    end
    @comments = @article.comments
    # redirect_to blog_path(@article)
    render 'blogs/create'
  end

  private
    def comment_params
      params.permit(:name, :email, :cnt)
    end
end
