Rails.application.routes.draw do
  get 'addresses/index'

  get 'addresses/show'

  get 'addresses/new'

  get 'addresses/edit'

  get 'checklists/index'

  get 'checklists/show'

  get 'checklists/new'

  get 'checklists/edit'

  get 'contacts/index'

  get 'contacts/show'

  get 'contacts/new'

  get 'contacts/edit'

  get 'documents/index'

  get 'documents/show'

  get 'documents/new'

  get 'documents/edit'

  get 'list_items/index'

  get 'list_items/show'

  get 'list_items/new'

  get 'list_items/edit'

  get 'reservations/index'

  get 'reservations/show'

  get 'reservations/new'

  get 'reservations/edit'

  get 'trips/index'

  get 'trips/show'

  get 'trips/new'

  get 'trips/edit'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'vaccines/index'

  get 'vaccines/show'

  get 'vaccines/new'

  get 'vaccines/edit'

  devise_for :users
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
