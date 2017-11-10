class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  # Выводить список станций в маршруте по порядковому номеру
  scope :sorted, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_number ASC").uniq }
  #scope :rrr, -> { select("railway_stations.*, railway_stations_routes.station_number") }

end
