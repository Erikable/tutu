class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  before_validation :set_title

  validate :stations_count
  validates :title, presence: true

  private

  def set_title
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут Должен содержать мин 2 станции")
    end
  end
end
