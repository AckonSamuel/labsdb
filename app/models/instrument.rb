class Instrument < ApplicationRecord
    has_many :instrument_categories
    has_many :categories, through: :instrument_categories
    has_many :instrument_labs
    has_many :labs, through: :instrument_labs
end
