class SearchesController < ApplicationController
 
  def new
    @stations = RailwayStation.all
  end

  def show
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    @routes = Route.search_route_with_stations(@start_station, @end_station)
  end
end
