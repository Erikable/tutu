class SearchesController < ApplicationController
  
  before_action :set_stations, only: [:show, :create]
  
  def show
  end

  def create
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    @routes = Route.search_route_with_stations(@start_station, @end_station)
    render :show
  end

  private
  
  def set_stations
    @stations = RailwayStation.all
  end
end
