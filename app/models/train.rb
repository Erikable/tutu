class Train < ApplicationRecord
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :wagons
  validates :number, presence: true

  def wagons_count(wagon_type)
    self.wagons.where(wagon_type: wagon_type).count
  end

  def seats_count(wagon_type, side_type)
    self.wagons.where(wagon_type: wagon_type).sum(side_type)
  end

end
