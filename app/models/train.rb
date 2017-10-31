class Train < ApplicationRecord
  has_many :wagons, -> (train) {if train.flag 
      order(number: :asc)
    else 
      order(number: :desc)
    end
  }

  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  validates :number, presence: true

  def count_seats(wagon_type, seats_type)
    wagons.where(type: wagon_type).sum(seats_type) 
  end

end
