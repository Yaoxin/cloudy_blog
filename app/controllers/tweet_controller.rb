class TweetController < ApplicationController
  def index
    @weibos = Weibo.order(created_at: :desc).all
  end
end
