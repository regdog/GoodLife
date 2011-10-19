GoodLife::Application.routes.draw do
  root :to => "welcome#index"

  devise_for :users, :controllers => {:omniauth_callbacks=>'user/omniauth_callbacks'} do
    get 'profile', :to => "devise/registrations#edit", :as=>'profile'
  end
 
  match '/user' => "feats#index", :as => :user_root

  resources :authentications

  devise_for :admin_users, :path => :admin, :module=>:admin

  scope "/view" do
    resources :checkins, :only => [:index] do
      collection do
        get 'latest'
        get 'epic'
      end
    end
    resources :feats, :only => [:index, :show] do
      get 'catalog', :on => :collection
      get 'checkin', :on => :member
    end

    get 'plans' => "plans#index"
    get 'plans/daily' => "plans#daily", :as => "daily_plans"
    get 'plans/weekly' => "plans#weekly", :as => "weekly_plans"
    get 'plans/weekend' => "plans#weekend", :as => "weekend_plans"

    resources :challenges, :except => :destroy do
      get 'mine', :on => :collection
      get 'date', :on => :collection
      get 'popularity', :on => :collection
      get 'points', :on => :collection
      get 'accept', :on => :member
      get 'leave', :on => :member
    end

    resources :rewards, :only => [:index, :show] do
      get 'local', :on => :collection
      get 'premium', :on => :collection
      get 'wishlist', :on => :collection
    end
  end

  get 'team/members' => "team#members", :as => :members_team
  get 'team/checkins' => "team#checkins", :as => :checkins_team
  get 'team/requests' => "team#requests", :as => :requests_team
  get 'team/invite' => "team#invite", :as => :invite_team

  get 'member/:nameid' => "member#show"

  match 'corp/:permalink' => 'contents#show'
  get 'search/index', :as => :search

  get 'kindeditor/images_list'
  post 'kindeditor/upload'

  namespace :admin do
       # Directs /admin/products/* to Admin::ProductsController
       # (app/controllers/admin/products_controller.rb)
    root :to => "dashboard#index"
    resources :feats do
      get 'feat_tokens', :on => :collection
    end
    resources :tags do
      get 'feat_tag_tokens', :on => :collection
      get 'reward_tag_tokens', :on => :collection
    end
    resources :rewards, :challenges, :partners, :categories, :contents
    resources :users, :only => [:index, :show, :destroy]
  end
end
