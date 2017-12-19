class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :order_stations, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }

  def update_position(route, station_number)
    station_route(route)&.update(station_number: station_number)
    # Используй & вместо try - он более строгий и не позволяет 
    #вызывать на объекте несуществующие методы (т.е. 1.try(:hello_world) 
    #не упадет, а просто вернет nil - очень легко допустить опечатку 
    #и не заметить этого).
    #station_route = railway_stations_routes.where(route: route).first
    #station_route.update(station_number: station_number) if station_route
  end
  # метод возвращает нужную позицию
  def position_in(route)
    station_route(route)&.station_number
    #station_route(route).try(:station_number)
  end

  def update_arrival_time(route, arrival_time)
    station_route(route)&.update(arrival_time: arrival_time)
    #station_route ||= railway_stations_routes.where(route: route).first
    #station_route.update(arrival_time: arrival_time) if station_route
  end

  def arrival_at(route)
    station_route(route)&.arrival_time&.strftime('%H:%M')
    #station_route(route).try(:arrival_time).try(:strftime, '%H:%M')
  end


  def update_departure_time(route, departure_time)
    station_route(route)&.update(departure_time: departure_time)
    #station_route ||= railway_stations_routes.where(route: route).first
    #station_route.update(departure_time: departure_time) if station_route
  end

  def departure_at(route)
    station_route(route)&.departure_time&.strftime('%H:%M')
    #station_route(route).try(:departure_time).try(:strftime, '%H:%M')
  end

  protected

  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end
end
