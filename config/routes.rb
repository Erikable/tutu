Rails.application.routes.draw do
  
  devise_for :users
  
  namespace :admin do 
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_arrival_time, on: :member
      patch :update_departure_time, on: :member
    end
    
    resources :trains do
      resources :wagons
    end

    resources :tickets
    resources :routes
  end
  
  #resources :users
  resources :tickets
  resource :search, only: [:show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'railway_stations#index'
end
