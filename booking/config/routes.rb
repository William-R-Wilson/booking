Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'


  resources :users, controller: 'manage_users'
  resources :visits
  resources :guests
  resources :days
  resources :employees
  resources :prices
  resources :cost_amount, only: [:edit, :update]
  #resources :reports
  get 'reports' => 'reports#index'
  get 'report' => 'reports#show'

  resources :admin_pages

  get 'schedules/get_dates' => 'schedules#get_dates', as: :get_dates
  resources :schedules, except: [:new]
  get 'schedule/new/:employee_id/:day_id' => 'schedules#new', as: :new_schedule

  #get 'schedule/:id' => 'schedules#show', as: :schedule
  #get 'schedules' => 'schedules#index', as: :schedules
  #post 'schedules/(.:format)' => 'schedules#create', as: :create_schedule
  #delete 'schedule/:id' => 'schedules#destroy', as: :delete_schedule
  #get 'schedule/:id/edit(.:format)' => 'schedule#edit', as: :edit_schedule
  #patch 'schedule/:id(.:format)' => 'schedule#update', as: :update_schedule

  get 'costing/:id' => 'costing#show', as: :costing
  get 'costing/:id/edit(.:format)' => 'costing#edit', as: :edit_hours
  patch 'costing/:id(.:format)' => 'costing#update', as: :update_hours
  post 'costing/:id(.:format)' => 'costing#create', as: :create_hours
  resource :calendar, only: [:show], controller: :calendar

  root "calendar#show"

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
