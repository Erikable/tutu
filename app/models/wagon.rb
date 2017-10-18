class Wagon < ApplicationRecord
  belonds_to :train
  
  validates :number, presence: true
end
