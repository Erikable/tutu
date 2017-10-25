class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route 

  validates :railway_station_id, uniqueness: {scope: :route_id}

  scope :sort_asc, -> {order(:station_number)}
end
