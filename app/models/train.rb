class Train < ApplicationRecord
  has_many :wagons#, -> (train) {if train.flag 
#      order(number: :asc)
#    else 
#      order(number: :desc)
#    end
#  }
 
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  validates :number, presence: true

  def count_seats(wagon_type, seats_type)
    wagons.where(type: wagon_type).sum(seats_type) 
  end

  def sorted_wagons
    if flag
      wagons.order("wagons.number ASC")
      #wagons.order(number: :asc)
      #Train.joins(:wagons).order(wagons: { number: :asc })
    else
      wagons.order("wagons.number DESC")
      #wagons.order(number: :desc)
      #Train.joins(:wagons).order(wagons: { number: :desc })
    end
  end

end
