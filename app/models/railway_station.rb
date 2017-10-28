class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  # scope :sort_stations_asc, -> { order('station_number DESC') }
  # scope :sorted, -> { joins(:railway_stations_routes).order(‘railway_stations_routes.station_number ASC’) }
  
  def set_station_number
  
  end

end
