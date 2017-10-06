class CreateRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_stations_routes do |t|
    t.integer :railway_station_id
    t.integer :route_id
    end
  end
end
