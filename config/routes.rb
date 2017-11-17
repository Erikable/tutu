Rails.application.routes.draw do
  
  resources :trains do
    resources :wagons
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end
  
  resources :routes
  #resources :wagons # delete it later !!!

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'railway_stations#index'
end
