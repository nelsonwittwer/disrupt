Disrupt::Application.routes.draw do



  resources :tags

  resources :topics

  resources :roles

  resources :images

  resources :startups do
  	resources :discussions do
      member{post :vote} 
      resources :comments do
        member{post :vote} 
      end
    end
  end



  devise_for :users, :path_prefix => 'd'
  resources :users

  namespace :user do
  	root :to => "startups#index"
  end

  #as :user do
  #	get "/signin" => "devise/sessions#new"
  #	get "/signout" => "devise/sessions#destroy"
  #	get "/signup" => "devise/registrations#new"
  #end

  devise_scope :user do
    get "/signin" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new"
    get "/signout" => "devise/sessions#destroy"
  end
  

  match '/about' => "static_pages#about"
  match '/contact' => "static_pages#contact"
  match '/suggest' => "static_pages#suggest"


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
  root :to => 'static_pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
