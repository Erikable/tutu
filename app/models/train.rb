class Train < ApplicationRecord
  has_many :wagons
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  validates :number, presence: true

  def sort_wagons
    
  end
end
