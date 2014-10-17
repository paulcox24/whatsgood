Rails.application.routes.draw do


  get 'categories/update_eventful_categories', as: 'update_categories'

  resources :categories, only: [:destroy, :index]

  root 'static_pages#home'

  get 'static_pages/about', as: 'about'

  get 'static_pages/contact'

  get 'static_pages/this_week'

  get 'static_pages/today'

  get 'static_pages/load_more_results' => 'static_pages#load_more_results'

  devise_for :users, :controllers => { registrations: 'registrations' , omniauth_callbacks: "omniauth_callbacks"}
  resources :users, :only => [:show, :index, :edit, :update, :destroy] do
    get '/profile', to: 'users#profile', as: :profile
    resources :events
  end  
    
  
  resources :venues
  resources :acts


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
