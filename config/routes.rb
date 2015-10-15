Rails.application.routes.draw do
  devise_for :users
  root 'static_page#home'
  get "documents/pdf"
  get '/about', to: 'static_page#about_us', as: :about 
  resources :users do
    resources :addresses # done here and under reservations
    resources :contacts
    resources :documents
    resources :vaccines
    resources :trips do
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
      resources :activities, controller: 'reservations', type: 'Activity' do 
        resources :addresses # done twice STI inheritance.
      end
      resources :events, controller: 'reservations', type: 'Event' do 
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

end
