class Train < ApplicationRecord
	belongs_to :route
	has_many :tickets
end
