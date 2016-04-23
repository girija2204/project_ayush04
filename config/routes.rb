Rails.application.routes.draw do

  get 'comm_memberships/create'

  get 'comm_memberships/destroy'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "unlike", to: "posts#downvote"
    end
    resources :comments
  end

  resources :discussions do
    resources :d_comments
  end

  resources :welcome
  resources :relationships, only: [:create, :destroy]
  resources :comm_memberships, only: [:create, :destroy]
  resources :communities
  resources :activity_loggers

  root 'welcome#index'

  get 'communities/create'

  get 'dashboard/:id' => 'dashboard#show', as: :dashboard

  devise_for :users, controllers: { registrations: "registrations"}
  
  get 'profile/:id/about_me' => 'profiles#about_me', as: :profile
  get 'profile/:id/all_posts' => 'profiles#all_posts', as: :all_posts
  get 'profile/:id/educational' => 'profiles#edu_details', as: :edu_details
  get 'profile/:id/employment' => 'profiles#emp_details', as: :emp_details
  get 'profile/:id/communities' => 'profiles#show_comms', as: :prof_comms
  #post 'profile/:id' => 'profiles#update', as: :profile_update
  get 'profile/:id/first' => 'profiles#first_step', as: :first_step
  post 'profile/:id/first' => 'profiles#save_attributes'
  get 'profile/:id/second' => 'profiles#second_step', as: :second_step
  post 'profile/:id/second' => 'profiles#final_save_attributes'

  post 'profile/:id/educational' => 'edu_emp_details#create_edu'
  post 'profile/:id/employment' => 'edu_emp_details#create_emp'

  resources :educational_details
  resources :employment_details

  get ':id/following' => 'relationships#following', as: :following
  get ':id/followers' => 'relationships#followers', as: :followers
  
  get 'dashboard/:id/communities' => 'dashboard#show_comms', as: :dash_comms
  get 'community/:id/members' => 'communities#members', as: :members
  get 'community/:id' => 'communities#discussion_form', as: :comm
  get 'community/:id/discussions' => 'communities#show', as: :disc_board
  get 'community/:id/about_comm' => 'communities#about_comm', as: :about_comm
  
  #get 'dashboard/:id/activity_logger' => 'activity_loggers#show', as: :show_logger
  #get 'dashboard/:id/activity_logger/add' => 'activity_loggers#new', as: :add_logger
  #get 'dashboard/:id/activity_logger/new_physical' => 'activity_loggers#new_physical', as: :physical_logger
  #post 'dashboard/:id/activity_logger/new_physical' => 'activity_loggers#create'

  #get 'dashboard/:id/activity_logger/new_food' => 'activity_loggers#new_food', as: :food_logger
  #post 'dashboard/:id/activity_logger/new_food' => 'activity_loggers#food_create'

  get 'activity_logger/day_activities/:activity_type' => 'activity_loggers#day_logger', as: :day_logger
  get 'activity_logger/week_activities/:activity_type' => 'activity_loggers#week_logger', as: :week_logger
  get 'activity_logger/month_activities/:activity_type' => 'activity_loggers#month_logger', as: :month_logger
  get 'activity_logger/calendar_activities/:activity_type' => 'activity_loggers#calendar_logger', as: :calendar_logger

  #get 'activity_logger/:activity_type' => 'activity_loggers#show', as: :show_logger
  
  get 'activity_logger/add' => 'activity_loggers#new', as: :add_logger
  get 'activity_logger/new_physical' => 'activity_loggers#new_physical', as: :physical_logger
  post 'activity_logger/new_physical' => 'activity_loggers#create'

  get 'activity_logger/new_food' => 'activity_loggers#new_food', as: :food_logger
  post 'activity_logger/new_food' => 'activity_loggers#food_create'

  #resources :dashboard do
  #  member do
  #    get :following, :followers
  #  end
  #end


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
