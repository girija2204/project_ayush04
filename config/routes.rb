Rails.application.routes.draw do

  get 'communities/create'

  get 'dashboard/:id' => 'dashboard#show', as: :dashboard

  resources :posts do
    resources :comments
  end

  #get ':id/discussion/new' => 'discussions#new'
  #post ':id/discussion/new' => 'discussions#create'

  resources :discussions do
    resources :d_comments
  end

  #resources :users

  get 'community/:id/discussions' => 'communities#show', as: :disc_board

  resources :welcome
  devise_for :users, controllers: { registrations: "registrations"}

  #resources :dashboard do
  #  member do
  #    get :following, :followers
  #  end
  #end
  
  post 'profile/:id' => 'profiles#update', as: :profile_update
  
  get 'profile/:id/first' => 'profiles#first_step', as: :first_step
  post 'profile/:id/first' => 'profiles#save_attributes'
  
  get 'profile/:id/second' => 'profiles#second_step', as: :second_step
  post 'profile/:id/second' => 'profiles#final_save_attributes'

  get ':id/following' => 'relationships#following', as: :following
  get ':id/followers' => 'relationships#followers', as: :followers
  
  get ':id/communities' => 'communities#show_comms'

  get 'community/:id/members' => 'communities#members', as: :members
  get 'community/:id' => 'communities#discussion_form', as: :comm
  
  get 'profile/:id' => 'profiles#show', as: :profile
  
  root 'welcome#index'

  resources :relationships, only: [:create, :destroy]
  resources :communities


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
