class Train < ApplicationRecord
  has_many :wagons
 
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  validates :number, presence: true

  def count_seats(wagon_type, seats_type)
    wagons.where(type: wagon_type).sum(seats_type) 
  end
  
  def sorted_wagons
    sort_direction = sort_from_head ? :asc : :desc
    wagons.order(number: sort_direction)
  end
end
