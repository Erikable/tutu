class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :sorted, -> { joins(:railway_stations_routes, :routes).order("railway_stations_routes.station_number ASC").uniq }
  
  scope :station_number_to_station, -> { select("railway_stations.*, railway_stations_routes.station_number") }

end
