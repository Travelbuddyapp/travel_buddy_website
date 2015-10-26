Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get "documents/pdf"
  get '/about', to: 'static_pages#about_us', as: :about
  get '/account', to: 'static_pages#account', as: :account
  get '/get_markers', to: 'reservations#get_markers', as: :get_markers

  get 'by_type', to: 'reservations#by_type'
  # get 'by_type', to: 'static_pages#by_type'

  resources :addresses
  resources :contacts
  resources :documents
  resources :vaccines
  resources :trips do
    resources :reservations
    resources :lodgings, controller: 'reservations', type: 'Lodging' do
    end
    resources :travels, controller: 'reservations', type: 'Travel' do
    end
    resources :vehicles, controller: 'reservations', type: 'Vehicle' do
    end
    resources :dinings, controller: 'reservations', type: 'Dining' do 
    end
    resources :activities, controller: 'reservations', type: 'Activity' do 
    end
    resources :events, controller: 'reservations', type: 'Event' do 
    end
    resources :other, controller: 'reservations', type: 'Other' do 
    end #end of addresses nested inside of reservation
    resources :checklists do
      resources :list_items
    end # end of cheklist/list item do loop
  end # end of trips nesting loop

end
