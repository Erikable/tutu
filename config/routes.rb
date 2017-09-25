Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'railway_stations#index'
end
