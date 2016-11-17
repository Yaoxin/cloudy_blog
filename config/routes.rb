require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do

  get 'blogs/show'

  get 'home/index'

  get 'blogs/index'

  resources :blogs, :only=>[:index, :show, :edit] do
  end

  namespace :admin do
    resources :articles do
      post :preview
    end
    root "dashboard#index"
  end

  root 'blogs#index'

  get '/about' => 'home#index'


  # writer your routes here

  mount Sidekiq::Web => '/sidekiq'
  mount StatusPage::Engine => '/'
  #mount ActionCable.server => '/cable'
end
