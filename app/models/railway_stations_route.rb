class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route 

  validates :railway_station_id, uniqueness: {scope: :route_id}

  # Выводить список станций в маршруте по порядковому номеру 
  # (использовать скоуп для сортировки)
  # в итоге как из скринкаста дефолтный поставил
  default_scope { order(:station_number) }

end
