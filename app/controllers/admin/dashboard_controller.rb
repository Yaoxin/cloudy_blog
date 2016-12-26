class Admin::DashboardController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def index
    @article_count = Article.all.size
    @weibo_count = Weibo.all.size
  end
end
