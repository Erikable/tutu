class Route < ApplicationRecord
	validates :title, presence: true
	has_many :railway_stations_routes
	has_many :railway_stations, through: :railway_stations_routes
end
