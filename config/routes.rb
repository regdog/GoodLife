GoodLife::Application.routes.draw do
  resources :feats
  resources :rewards
  resources :authentications
  resources :content_nodes

  get 'kindeditor/images_list'
  post 'kindeditor/upload'
  get 'search/index', :as => :search
  match 'checkins/myteam' => 'checkins#show_my_team'
  match 'checkins/mychallenges' => 'checkins#show_my_challenges'
  match 'checkins/all' => 'checkins#all'

  devise_for :user, :controllers => {:omniauth_callbacks=>'user/omniauth_callbacks'} do
    get 'profile', :to => "devise/registrations#edit", :as=>'profile'
  end
  
  match '/user' => "feats#index", :as => :user_root
  match 'feats/checkins/:feat_id' => 'feats#checkin'
  
  devise_for :administrators, :path=>:admin, :module=>:admin
  
  namespace :admin do
       # Directs /admin/products/* to Admin::ProductsController
       # (app/controllers/admin/products_controller.rb)  
    resources :content_nodes
    resources :feats
    resources :rewards
    resources :challenges
    resources :partners
    resources :tags

    get 'partners/list'
    get 'tags/list'
    get 'content_nodes/list'
    match 'checkins' => 'checkins#index'

    root :to => "dashboard#index"
  end

  match 'mma/:permalink' => "content_nodes#show"
  root :to => "welcome#index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
