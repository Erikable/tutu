class RailwayStation < ApplicationRecord
	has_many :railway_stations_routes
	has_many :routes, through: :railway_stations_routes
end
