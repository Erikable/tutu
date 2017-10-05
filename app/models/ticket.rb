class Ticket < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :train, optional: true

	belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true
end
