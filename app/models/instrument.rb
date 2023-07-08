class Instrument < ApplicationRecord
    has_many :instrument_categories
    has_many :categories, through: :instrument_categories
    has_many :labs, through: :instument_labs
    has_one :instrumentdetail
    belongs_to :vendor
end
