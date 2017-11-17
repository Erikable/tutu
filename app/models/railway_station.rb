class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :ordered_station_number_to_station, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }

  def update_position(route, station_number)
    station_route = railway_stations_routes.where(route: route).first
    station_route.update(station_number: station_number) if station_route
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  def update_arrival_time(route, arrival_time)
    station_route ||= railway_stations_routes.where(route: route).first
    station_route.update(arrival_time: arrival_time) if station_route
  end

  def arrival_at(route)
    station_route(route).try(:arrival_time)
  end


  def update_departure_time(route, arrival_time)
    station_route ||= railway_stations_routes.where(route: route).first
    station_route.update(departure_time: departure_time) if station_route
  end

  def departure_at(route)
    station_route(route).try(:departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
