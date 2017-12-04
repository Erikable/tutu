class SearchesController < ApplicationController
 
 def new

 end

 def show
  @start_station = RailwayStation.find(params[:start_station_id])
  @end_station = RailwayStation.find(params[:end_station_id])
  @routes = Route.stations_routes(@start_station, @end_station)
 end

 def edit
   
 end

  #def search_params
  #  params.require(:search).permit(:start_station_id, :end_station_id)
  #end
end
