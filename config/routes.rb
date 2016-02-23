Rails.application.routes.draw do

  root 'application#index'

  post 'customer', to: 'customer#create'

  get 'customer', to: 'customer#index'

  get 'customer/edit/:id', to: 'customer#edit_view'

  post 'customer/edit', to: 'customer#edit'

  get 'customer/delete/:id', to: 'customer#delete'

  post 'user', to: 'user#create'

  get 'user', to: 'user#index'

  post 'user/edit', to: 'user#edit'

  get 'user/delete/:id', to: 'user#delete'

  get '/help', to: 'application#help'

  get '/contact', to: 'application#contact'

  get 'customer/view'

  get 'item', to: 'item#index'

  post 'item', to: 'item#create'

  get 'item/edit/:id', to: 'item#edit_view'

  post 'item/edit', to: 'item#edit'

  get 'item/delete/:id', to: 'item#delete'

  get 'sale', to: 'sale#index'

  post 'sale', to: 'sale#create'

  post 'user/login', to: 'user#log_in'

  post 'user/logout', to: 'user#log_out'

  get 'user/index_incorrect', to: 'user#index_incorrect'

  get 'user/logged_out', to: 'user#index_not_logged_in'

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
