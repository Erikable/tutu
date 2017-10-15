class Train < ApplicationRecord
  belongs_to :route, optional: true
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :wagons
  validates :number, presence: true

  def train_has_wagons(wag_type) # Кол-во плацкартный/купейных вагонов в составе поезда
    self.wagons.count {|wagon| wagon.wagon_type == wag_type}
  end

  def seats_in_wagon(wag_type, side_type) # Кол-во мест: плацкартных верхних/нижних, купейных верхних/нижних
    self.wagons.where(wagon_type: wag_type).sum(side_type)
  end

end
