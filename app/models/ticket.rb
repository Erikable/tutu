class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id, optional: true
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id, optional: true
  validates :number, presence: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :passport, presence: true
  after_create :buy_notification
  after_destroy :destroy_notification
  
  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private
  
  def buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
  def destroy_notification
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
