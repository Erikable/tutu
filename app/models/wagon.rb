class Wagon < ApplicationRecord
  belongs_to :train

  before_validation :set_number
  
  validates :number , uniqueness: {scope: :train_id}  
  validates :number, presence: true

  scope :economy, -> { where(type: 'PlatscartWagon') }
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :economy, -> { where(type: 'SvWagon') }
  scope :coupe, -> { where(type: 'SeatWagon') }
  scope :ordered, -> { order(:number) }

  private

  def set_number
    self.number = train.wagons.maximum(:number).to_i + 1
  end
end
