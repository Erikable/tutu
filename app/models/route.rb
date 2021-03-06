class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  before_validation :set_title
  
  validate :stations_count
  validates :title, presence: true
 
  def self.search_route_with_stations(start_station_id, end_station_id)
    joins(:railway_stations).where(railway_stations: { id: start_station_id }) & joins(:railway_stations).where(railway_stations: { id: end_station_id })
  end

  private
  def set_title
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут Должен содержать 2 станции")
    end
  end
end
