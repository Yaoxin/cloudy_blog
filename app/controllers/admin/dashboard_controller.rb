class Admin::DashboardController < ApplicationController
  layout 'layouts/admin'
  # before_action :authericate_user!

  def index
    @article_count = Article.all.size
  end
end
