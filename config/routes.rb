require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do

  get 'tweet/index'

  get 'home/index'

  resources :blogs, :only=>[:index, :show, :edit] do
    resources :comments, only: [:index, :create]
  end



  resources :photos, :only=>[:create]

  namespace :admin do
    resources :articles, except: [:show] do
      collection do
        post :preview
      end
    end
    resources :sessions, :only=>[:new, :create, :destroy]

    resources :weibos

    root "dashboard#index"
  end

  root 'blogs#index'

  get '/about' => 'home#index'

  get '/tweet' => 'tweet#index'


  # writer your routes here

  mount Sidekiq::Web => '/sidekiq'
  mount StatusPage::Engine => '/'
  #mount ActionCable.server => '/cable'
end
