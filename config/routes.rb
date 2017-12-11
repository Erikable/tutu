Rails.application.routes.draw do
  
  resources :users
  resources :tickets
  
  resources :trains do
    resources :wagons
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrival_time, on: :member
    patch :update_departure_time, on: :member
  end
  
  resources :routes
  resource :search, only: [:new, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'railway_stations#index'
end
