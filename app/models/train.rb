class Train < ApplicationRecord
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :wagons
  validates :number, presence: true
end
