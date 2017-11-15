class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  #scope :sorted, -> { joins(:railway_stations_routes, :routes).order("railway_stations_routes.station_number ASC").uniq }
  #scope :station_number_to_station, -> { select("railway_stations.*, railway_stations_routes.station_number") }
  scope :ordered_station_number_to_station, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }

  def update_position(route, station_number)
    station_route = railway_stations_routes.where(route: route).first
    station_route.update(station_number: station_number) if station_route
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
