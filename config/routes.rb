Rails.application.routes.draw do

  root 'static_page#home'
  get '/about', to: 'static_page#about_us', as: :about 

  devise_for :users
  resources :users do
    resources :addresses # done twice
    resources :contacts  # done twice
    resources :documents
    resources :vaccines
    resources :trips do
      resources :contacts  # done twice
      resources :reservations
      resources :lodging, controller: 'reservations', type: 'Lodging' do
        resources :addresses # done twice STI inheritance.
      end
      resources :travel, controller: 'reservations', type: 'Travel' do
        resources :addresses # done twice STI inheritance.
      end
      resources :vehicle, controller: 'reservations', type: 'Vehicle' do
        resources :addresses # done twice STI inheritance.
      end
      resources :dining, controller: 'reservations', type: 'Dining' do 
        resources :addresses # done twice STI inheritance.
      end
      resources :activities, controller: 'reservations', type: 'Activities' do 
        resources :addresses # done twice STI inheritance.
      end
      resources :events, controller: 'reservations', type: 'Events' do 
        resources :addresses # done twice STI inheritance.
      end
      resources :other, controller: 'reservations', type: 'Other' do 
        resources :addresses # done twice STI inheritance.
      end #end of addresses nested inside of reservation
      resources :checklists do
        resources :list_items
      end # end of cheklist/list item do loop
    end # end of trips nesting loop
  end # end of users nesting.

  

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
