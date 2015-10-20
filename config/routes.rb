Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get "documents/pdf"
  get '/about', to: 'static_pages#about_us', as: :about
  get '/account', to: 'static_pages#account', as: :account

  resources :addresses # done here and under reservations
  resources :contacts
  resources :documents
  resources :vaccines
  resources :trips do
    resources :reservations
    resources :lodgings, controller: 'reservations', type: 'Lodging' do
      # resources :addresses # done twice STI inheritance.
    end
    resources :travels, controller: 'reservations', type: 'Travel' do
      # resources :addresses # done twice STI inheritance.
    end
    resources :vehicles, controller: 'reservations', type: 'Vehicle' do
      # resources :addresses # done twice STI inheritance.
    end
    resources :dinings, controller: 'reservations', type: 'Dining' do 
      # resources :addresses # done twice STI inheritance.
    end
    resources :activities, controller: 'reservations', type: 'Activity' do 
      # resources :addresses # done twice STI inheritance.
    end
    resources :events, controller: 'reservations', type: 'Event' do 
      # resources :addresses # done twice STI inheritance.
    end
    resources :other, controller: 'reservations', type: 'Other' do 
      # resources :addresses # done twice STI inheritance.
    end #end of addresses nested inside of reservation
    resources :checklists do
      resources :list_items
    end # end of cheklist/list item do loop
  end # end of trips nesting loop


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
